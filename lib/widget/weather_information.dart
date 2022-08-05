import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({required this.weatherModel, Key? key})
      : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        Icon(Icons.wb_sunny, color: Colors.yellow),
        const SizedBox(height: 10),
        Text('${weatherModel.main.temp} °C'),
        const SizedBox(
          height: 10,
        ),
        Text('${weatherModel.name} '),
        const SizedBox(
          height: 10,
        ),
        Text('${weatherModel.weather.first.description} '),
        const SizedBox(
          height: 10,
        ),
      ],
    ));
  }
}
