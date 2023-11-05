import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../services/navigation_service.dart';
import '../services/service_locator.dart';
import '../utils/custom_colors.dart';

abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {
  final NavigationService navigationService = locator<NavigationService>();
  Locale currentLocale = Locale('tr');
  late OverlayEntry? _progressOverlayEntry;

  Timer? _timeoutTimer;
  static const TIMEOUT = 120;
  int _start = TIMEOUT;

  @override
  void initState() {
    super.initState();
    _progressOverlayEntry = null;
  }

  void startTimer() {
    if (_timeoutTimer != null) _timeoutTimer!.cancel();
    const oneSec = const Duration(seconds: 1);
    _timeoutTimer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          _start = TIMEOUT;
          if (_progressOverlayEntry != null) hideProgress();
          timer.cancel();
        } else {
          _start--;
        }
      },
    );
  }

  void showProgress(BuildContext context) {
    if (_progressOverlayEntry != null) {
      return;
    }
    _progressOverlayEntry = _createdProgressEntry(context);
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        Overlay.of(context).insert(_progressOverlayEntry!);
        startTimer();
      },
    );
  }

  void hideProgress() {
    try {
      if (_progressOverlayEntry != null && _progressOverlayEntry!.mounted) {
        _progressOverlayEntry!.remove();
        _progressOverlayEntry = null;
      }
    } catch (e) {
      //
    }
  }

  OverlayEntry _createdProgressEntry(BuildContext context) => OverlayEntry(
        builder: (BuildContext context) => Stack(
          children: <Widget>[
            Container(
              color: Colors.black.withOpacity(0.4),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: CustomColors.customBottomNavigationColor,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
