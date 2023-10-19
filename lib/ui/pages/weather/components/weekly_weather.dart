import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:a_news_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class WeeklyWeather extends StatefulWidget {
  final String? day;
  final String? imageAddress;
  final String? degrees;

  const WeeklyWeather({
    super.key,
    required this.day,
    required this.imageAddress,
    required this.degrees,
  });

  @override
  State<WeeklyWeather> createState() => _WeeklyWeatherState();
}

class _WeeklyWeatherState extends BaseStatefulState<WeeklyWeather> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              widget.day ?? "Pazartesi",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: CustomColors.black,
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                widget.imageAddress ?? "images/ic_home_inactive.png",
                height: 30,
                width: 30,
              ),
              const SizedBox(width: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.degrees ?? "0°",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: CustomColors.black,
                    ),
                  ),
                  Text(
                    "°",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: CustomColors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
