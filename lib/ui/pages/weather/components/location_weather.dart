import 'package:a_news_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class LocationWeather extends StatefulWidget {
  final String? location;
  final String? degrees;

  const LocationWeather({
    super.key,
    required this.location, required this.degrees,
  });

  @override
  State<LocationWeather> createState() => _LocationWeatherState();
}

class _LocationWeatherState extends State<LocationWeather> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/ic_home_inactive.png",
            width: 20,
          ),
          Text(
            widget.location ?? "-",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: CustomColors.black,
            ),
          ),
          Text(
            widget.degrees ?? "0°",
            style: TextStyle(
              fontSize: 66,
              fontWeight: FontWeight.w700,
              color: CustomColors.black,
            ),
          ),
        ],
      ),
    );
  }
}

