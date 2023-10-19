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
          height: 40,
        ),
        const SizedBox(height: 10),
        Text(
          widget.location ?? "-",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).textTheme.titleMedium?.color,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.degrees}" ?? "0°",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).textTheme.titleMedium?.color,
                ),
              ),
              Text(
                "°",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).textTheme.titleMedium?.color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
