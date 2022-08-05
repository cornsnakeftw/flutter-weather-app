import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherServie {
  Future<WeatherModel> fetchWeatherInformation(String cityName) async {
    const String apiKey = '3be1d1d5ad43ab35ad281ea5024cc506';
    final Uri url = Uri(
      scheme: 'https',
      host: 'api.openweathermap.org',
      path: 'data/2.5/weather',
      queryParameters: {'q': cityName, 'appid': apiKey},
    );

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load weather information.');
    }
  }
}
