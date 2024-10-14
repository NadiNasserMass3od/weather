import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/body.dart';
import 'package:weather/color.dart';
import 'package:weather/data.dart';
import 'package:weather/loading.dart';
import 'package:weather/search.dart';

String countryName = 'Egypt';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dio = Dio();
  Map<String, dynamic> data = {};

  WeatherData weatherData = WeatherData(
    name: "",
    country: "",
    text: "",
    icon: "",
    temp: 0,
  );
  bool error = false;
  Search search = const Search();
  getWeather(String country) async {
    final response = await dio.get(
      "http://api.weatherapi.com/v1/forecast.json",
      queryParameters: {
        'key': 'fd1c80abec1a4b2a806134230241007',
        'q': country,
        'days': '3',
        'aqi': 'no',
        'alerts': 'no',
      },
    );
    setState(() {
      if (response.statusCode == 200) {
        weatherData = WeatherData(
          name: response.data['location']['name'],
          country: response.data['location']['country'],
          text: response.data['current']['condition']['text'],
          icon: response.data['current']['condition']['icon'],
          temp: response.data['current']['temp_c'],
        );
        data = response.data;
      } else {
        error = true;
      }
    });
    print(data);
    // print(response.data['current']['condition']['text']);
  }

  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    getWeather(countryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      appBar: AppBar(
        backgroundColor: blue,
        title: Text(
          "Weather",
          style: TextStyle(color: white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            error
                ? const Loading()
                : Expanded(
                    child: Column(
                      children: [
                        search,
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Body(
                            weatherData: weatherData,
                            data: data['forecast']['forecastday'],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            getWeather(countryName);
          });
          print(countryName);
          // print(data['forecast']['forecastday']);
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
