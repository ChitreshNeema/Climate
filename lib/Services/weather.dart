import 'package:world_time/Services/location.dart';
import 'package:world_time/Services/networking.dart';
const apikey='7a960abe0caa88b4f760b75a525e5783';

class Weathermodel {
  Future<dynamic> getCityweather(String cityname) async{
    var url='https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apikey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;

  }


  Future<dynamic> getLocationWeather() async {
    print('getlocationweather.weather.dart started');
    Location location= Location();
    print('get current location started');
    await location.getCurrentLocation();
    print('get current location ended');
    NetworkHelper network = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?'
        'lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    var weatherdata = await network.getData();
    print('returning weather data weather.dart');
    return weatherdata;

  }

  void getBackground(int condition){ //convert the function to String
  //return location of jpeg
  }
}