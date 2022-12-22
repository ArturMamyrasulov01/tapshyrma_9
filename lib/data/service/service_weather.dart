import 'package:dio/dio.dart';
import 'package:tapshyrma_9/data/model/model_weather.dart';

class ServiceWeather extends Object {
  String? city;
  ServiceWeather({
    this.city = 'Bishkek',
  });
  Future<WeatherModel> getWeather() async {
    Response response = await Dio().get(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=e5061b2d3f4d35ab71d1b211801413e2');
    return WeatherModel.fromJson(response.data);
  }
}
