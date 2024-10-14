import 'package:flutter/material.dart';
import 'package:weather/color.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Something error.",
              style: TextStyle(
                color: white,
                fontSize: MediaQuery.of(context).size.width * 0.1,
              ),
            ),
            Text(
              "Try again.",
              style: TextStyle(
                color: white,
                fontSize: MediaQuery.of(context).size.width * 0.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
