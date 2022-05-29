import 'package:flutter/material.dart';
import 'package:world_time/Screens/city_screen.dart';
import 'package:world_time/Services/weather.dart';
class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationweather});
  final locationweather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double Temp=0,feels_like=0,mintemp=0,maxtemp=0;
  int temperature=0;
  String desc='',cityname='',Typedname='',icon='',country='';
  Weathermodel weathermodel = Weathermodel();
  @override
  initState(){
    super.initState();
    UpdateUi(widget.locationweather);
  }
  void UpdateUi(dynamic weatherData){
  setState((){
    if (weatherData == null){
      Temp= 0;
      desc='error';
    }
    else{
      print('weather is not null location screen dart');
      print(weatherData);
    Temp=weatherData['main']['temp'];
    temperature=Temp.toInt();
    Temp.toInt();
    feels_like=weatherData['main']['feels_like'];
    mintemp=weatherData['main']['temp_min'];
    maxtemp=weatherData['main']['temp_max'];
    desc=weatherData['weather'][0]['description'];
    cityname=weatherData['name'];
    icon=weatherData['weather'][0]['icon'];
    country=weatherData['sys']['country'];
    }});
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(onPressed: () async{
                      var nweatherData= await weathermodel.getLocationWeather();
                      UpdateUi(nweatherData);
                    },
                        icon: Icon(Icons.near_me),
                    color: Colors.white),
                  ),
                  Spacer(),
                  Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () async{
                    var Typedname = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return CityScreen();
                    },
                    ),
                    );
                    if (Typedname!=null) {
                      var weatherData = await weathermodel.getCityweather(Typedname);
                      UpdateUi(weatherData);
                    }
                    else{
                      Text('No city found by this name');
                    }
                  },
                  child: Icon(Icons.search),
                ),
              ),
              ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${desc.toUpperCase()}',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold ),
                ),
              ]),
              SizedBox(
                height: 500,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.network(
                      'http://openweathermap.org/img/wn/$icon@2x.png',
                  ),
                ),
              ),

          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              padding: EdgeInsets.only(left:10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$cityname,$country',
                      textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                  children: [
                    Text(
                      '$temperature\u00B0C',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text('min temp',
                        style: TextStyle(
                          color: Colors.white,
                        ),),
                        Text('${mintemp.toInt()}\u00B0C',
                        style: TextStyle(
                          color: Colors.white,
                        ),),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          Text('max temp',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          ),
                          Text('${maxtemp.toInt()}\u00B0C',
                            style: TextStyle(
                            color: Colors.white,
                              ),
                          ),
              ]
                      ),
                    )
                  ],
                  ),
                    Text('feels like ${feels_like.toInt()}\u00B0C',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    )
                    ]
                    )
                    ),
          )
              ]
      ),
        )
      ),
    );
  }
}
