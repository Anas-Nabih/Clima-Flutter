import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey ='b471fc2165ad805c84377b10d898e60c';
const openWeatherMapUrl ='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityName(String cityName) async{
    NetWorkHelper networkHelper = NetWorkHelper(
        "$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric"
    );

    var weatherData = await networkHelper.getData();
    return weatherData;
}
  Future<dynamic> getLocationWeather()async {
    Location location = Location();
    await location.getCurrentLocation();

    NetWorkHelper netWorkHelper = NetWorkHelper('$openWeatherMapUrl?'
        'lat=${location.latitude}&lon=${location.longtitude}&appid=$apiKey&units=metric');

    var weatherData = await netWorkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
