import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();
  


  void getLocation() async {
    await location.getLocation();

    showAlert();
    print(location.longitude);
    print(location.latitude);

    Networking networking =
        Networking(latitude: location.latitude, longitude: location.longitude);

    var decodedData = await networking.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: decodedData,
      );
    }));
  }

  void showAlert() {
    if (location.alert) {
      Alert(
        context: context,
        type: AlertType.error,
        style: AlertStyle(
            descStyle: TextStyle(color: Colors.white),
            titleStyle: TextStyle(color: Colors.white)),
        title: "LOCATION ALERT",
        desc: "Allow Location Services To This Application. Allow it manualy",
        buttons: [
          DialogButton(
            color: Colors.blue,
            child: Text(
              "Cancel",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    }
  }

  @override
  initState() {
    getLocation();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRing(
          color: Colors.white,
        ),
      ),
    );
  }
}
