import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityname ='';

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height:100
      ),
      decoration: BoxDecoration(
          image:DecorationImage(image: AssetImage('assets/images/city_screenbackground.jpg'),
            fit: BoxFit.cover,
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: SafeArea(child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),

                ),
              ),
              Container(
               padding: EdgeInsets.all(20),
               child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  icon: Icon(
                      Icons.location_city,
                  color: Colors.black,
                  ),
                  hintText:'Enter city Name',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ) ,
                 onChanged:(value) {
                  cityname=value;
                 },

              ),
              ),
              Container(
               child: Center(
                 child: ElevatedButton(onPressed: (){
                  Navigator.pop(context,cityname);
                },
                  child: Text('get location'),),
              ),
              )
            ],
          )
          ),
        ),
      ),
    );
  }
}
