import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tapshyrma_9/data/model/model_weather.dart';

class ServiceWeather extends Object {
  static Future<WeatherModel> getWeather(
      {final String? cityName = "Osh"}) async {
    String? city = cityName;
    Response response = await Dio().get(
      'https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=e5061b2d3f4d35ab71d1b211801413e2',
    );
    log('$city');
    return WeatherModel.fromJson(response.data);
  }
}
