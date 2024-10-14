// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather/card.dart';
import 'package:weather/color.dart';
import 'package:weather/data.dart';

class Body extends StatefulWidget {
  WeatherData weatherData;
  List<dynamic>? data;

  Body({
    super.key,
    required this.weatherData,
    required this.data,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.location_pin,
              color: white,
              size: MediaQuery.of(context).size.width * 0.15,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.weatherData.getCountry(),
                  style: TextStyle(
                    color: white,
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                  ),
                ),
                Text(
                  widget.weatherData.getName(),
                  style: TextStyle(
                    color: white,
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  widget.weatherData.getText(),
                  style: TextStyle(
                    color: white,
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                  ),
                ),
                Text(
                  "${widget.weatherData.getTemp()}",
                  style: TextStyle(
                    color: white,
                    fontSize: MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            Image.network("https:${widget.weatherData.getIcon()}"),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.28,
              decoration: BoxDecoration(
                color: white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DayCard(data: widget.data![0]),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.28,
              decoration: BoxDecoration(
                color: white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DayCard(data: widget.data![1]),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.28,
              decoration: BoxDecoration(
                color: white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DayCard(data: widget.data![2]),
            ),
          ],
        )
      ],
    );
  }
}
