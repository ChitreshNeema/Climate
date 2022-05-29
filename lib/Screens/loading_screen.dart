import 'package:flutter/material.dart';
import 'package:world_time/Screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/Services/weather.dart';
class Loading_screen extends StatefulWidget {
  const Loading_screen({Key? key}) : super(key: key);

  @override
  State<Loading_screen> createState() => _Loading_screenState();
}

class _Loading_screenState extends State<Loading_screen> {
  @override
  initState(){
    super.initState();
      getLocationdata();
  }

  void getLocationdata() async{
    Weathermodel weathermodel =Weathermodel();
    print('getLocationweatherstart');
    var weather = await weathermodel.getLocationWeather();
    if (weather == null){
      print('weather returned is null');
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return LocationScreen(
          locationweather:weather,);
      }
      ));
    }
    else{
      print('weather returned is not null');
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(
        locationweather: weather,
      );
    }));}

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:SafeArea(
        child: Padding(
        padding: EdgeInsets.all(50),
        child: SpinKitCircle(
          color: Colors.white54,
          size: 100,
        ),
    )
    )
    );}
}
