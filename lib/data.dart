class WeatherData {
  String? name;
  String? country;
  String? text;
  String? icon;
  double? temp;

  WeatherData({
    required this.name,
    required this.country,
    required this.text,
    required this.icon,
    required this.temp,
  });

  getName() => name;
  getCountry() => country;
  getText() => text;
  getIcon() => icon;
  getTemp() => temp;
}
