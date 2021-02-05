import 'package:geolocator/geolocator.dart';


class Location{
  double latitude, longtitude;

 Future <void> getCurrentLocation() async{
    try{
      Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longtitude = position.longitude;
    }
    catch(e)
    {
      print(e);
    }
  }

}