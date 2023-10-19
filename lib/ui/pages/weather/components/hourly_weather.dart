import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:a_news_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class HourlyWeather extends StatefulWidget {
  final String? date;
  final String? imageAddress;
  final String? degrees;

  const HourlyWeather({
    super.key,
    required this.date,
    required this.imageAddress,
    required this.degrees,
  });

  @override
  State<HourlyWeather> createState() => _HourlyWeatherState();
}

class _HourlyWeatherState extends BaseStatefulState<HourlyWeather> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          children: [
            Text(
              widget.date ?? "00:00",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: CustomColors.black,
              ),
            ),
            const SizedBox(height: 12),
            Image.asset(
              widget.imageAddress ?? "images/ic_home_inactive.png",
              width: 26,
              height: 26,
            ),
            const Spacer(),
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
      ),
    );
  }
}
