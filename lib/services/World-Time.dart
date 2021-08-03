import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String location; // location name for UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDaytime;

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {

    try{
      // make the request
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      DateTime now = DateTime.parse(datetime);

      if(data['utc_offset'].substring(0,1)=="-"){
        now = now.subtract(Duration(hours: int.parse(offset)));
      }else if(data['utc_offset'].substring(0,1)=="+"){
        now = now.add(Duration(hours: int.parse(offset)));

      }

      // create DateTime object


      // set the time property
      isDaytime = now.hour>6&&now.hour<20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print(e);
      // time = 'could not get time';
    }

  }

}