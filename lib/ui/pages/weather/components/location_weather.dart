import 'package:a_news_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class LocationWeather extends StatefulWidget {
  final String? location;
  final String? degrees;
  final String? imageAddress;

  const LocationWeather({
    super.key,
    required this.location,
    required this.degrees,
    this.imageAddress,
  });

  @override
  State<LocationWeather> createState() => _LocationWeatherState();
}

class _LocationWeatherState extends State<LocationWeather> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          widget.imageAddress ?? "images/ic_home_active.png",
          width: 40,
        ),
        Text(
          widget.location ?? "-",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: CustomColors.black,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.degrees}" ?? "0°",
              style: TextStyle(
                fontSize: 66,
                fontWeight: FontWeight.w700,
                color: CustomColors.black,
              ),
            ),
            Text(
              "°",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w700,
                color: CustomColors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
