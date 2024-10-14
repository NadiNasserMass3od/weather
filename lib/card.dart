// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather/color.dart';

class DayCard extends StatefulWidget {
  DayCard({
    super.key,
    required this.data,
    // required this.icon,
    // required this.temp,
    // required this.text,
  });
  Map<String, dynamic> data = {};
  String text = '';
  String icon = '';
  String temp = '';
  // String text = '';

  @override
  State<DayCard> createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Text(
          "7",
          style: TextStyle(
            color: white,
            fontSize: MediaQuery.of(context).size.width * 0.06,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Text(
          widget.data['day']['condition']['text'],
          style: TextStyle(
            color: white,
            fontSize: MediaQuery.of(context).size.width * 0.06,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Image.network("https:${widget.data['day']['condition']['icon']}"),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Text(
          "${widget.data['day']['avgtemp_c']}",
          style: TextStyle(
            color: white,
            fontSize: MediaQuery.of(context).size.width * 0.06,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
      ],
    );
  }
}
