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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.purple),
              borderRadius: BorderRadius.circular(10)),
          child: Container(
            padding: EdgeInsets.all(16),
            height: 300,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wb_sunny, color: Colors.yellow, size: 40),
                const SizedBox(height: 10),
                Text('${weatherModel.main.temp} °C',
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Text('${weatherModel.name} ', style: TextStyle(fontSize: 20)),
                const SizedBox(
                  height: 10,
                ),
                Text('${weatherModel.weather.first.description} '),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
