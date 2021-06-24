import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;

  void showAlert() {
    Alert(
      context: context,
      type: AlertType.error,
      style: AlertStyle(
          descStyle: TextStyle(color: Colors.white),
          titleStyle: TextStyle(color: Colors.white)),
      title: "Name Error",
      desc: "City name cannot be empty",
      buttons: [
        DialogButton(
          color: Colors.blue,
          child: Text(
            "Cancel",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  int count(String string, String counter) {
    int count = 0;
    for (int i = 0; i < string.length; i++) {
      if (string[i] == counter) {
        count++;
      }
    }
    return count;
  }

  void checkData() {
    if (cityName == null || count(cityName, " ") == cityName.length) {
      showAlert();
    } else {
      print(cityName);
      Navigator.pop(context, cityName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value) {
                    cityName = value;
                  },
                  autocorrect: true,
                  autofocus: true,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.white,
                    ),
                    hintText: "Enter City name",
                    hintStyle: TextStyle(color: Color(0xFF2B2B2B)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15)),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  checkData();
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
