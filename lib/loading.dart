import 'package:flutter/material.dart';
import 'package:weather/color.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: CircularProgressIndicator(
          color: white,
          backgroundColor: white.withOpacity(0.1),
          strokeWidth: 7,
        ),
      ),
    );
  }
}
