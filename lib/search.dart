import 'package:flutter/material.dart';
import 'package:weather/color.dart';
import 'package:weather/home_page.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController textEditingController = TextEditingController();

  String text = '';

  getText() => text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: white.withOpacity(0.22),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: textEditingController,
                  onSubmitted: (value) {
                    setState(() {
                      countryName = value;
                    });
                  },
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.search,
                      color: white,
                    ),
                    hintText: "Search here ...",
                    hintStyle: TextStyle(
                      color: white.withOpacity(0.5),
                    ),
                  ),
                  cursorColor: blue,
                  style: TextStyle(
                    color: white,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
