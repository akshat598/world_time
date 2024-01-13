import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;//location name for thr ui
  String time="";//time in that location
  String flag;//url to an asset flag icon
  String url;//this is the location url for api endpoint
  WorldTime({required this.location,required this.flag,required this.url});
  late bool isDayTime;//true or false if daytime or not
  //late variable will enforce bool at runtime instead of compiler time to avoid
  //giving the error.

  Future<void>  getTime() async {
    try {
      //this is not a map,but a string representation of the object
      Response response = await get(
          Uri.parse("http://www.worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      //print(data);
      //print(offset);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(
          1, 3); //creating a substring and going
      //from position 1 to 3
      //print(datetime);
      //create datetime object
      DateTime now = DateTime.parse(datetime); //coverts into a datetime object
      now = now.add(Duration(hours: int.parse(offset)));
      //set the time property
      isDayTime = now.hour > 6 && now.hour<15? true : false;//time between 6am and 8pm
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}
