import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:a_news_app/utils/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../utils/custom_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BaseStatefulState<SplashPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      "images/splash_gif.mp4",
    )
      ..initialize().then((value) {
        setState(() {});
      })
      ..setVolume(0.0);

    _playVideo();
  }

  void _playVideo() async {
    _controller.play();
    await Future.delayed(const Duration(seconds: 9));

    navigationService.navigateTo(RouteHelper.onBoarding);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: Container(
        color: CustomColors.black,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
