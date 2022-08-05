import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/pages/weather_detail.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late final TextEditingController _controller;
  bool _isCityNameEmpty = true;

  @override

  /// to detect any changes in the TextField
  void initState() {
    super.initState();

    _controller = TextEditingController();

    _controller.addListener(() {
      setState(() => _isCityNameEmpty = _controller.text.isEmpty);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search City'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Please enter city name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                )),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    label: Text('City Name'),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    hintText: 'City name',
                    border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
              child: const Text('Search'),
              onPressed: _isCityNameEmpty
                  ? null
                  : () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WeatherDetail(cityName: _controller.text)));
                    }, //ternary condition uses question mark. short for 'IF-else'
            ),
          ],
        )));
  }
}
