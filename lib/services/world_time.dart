import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime {

  String url; //url for the api endpoint
  String location; //location which user chose
  String time; //time at the location
  String flag; //asset image url for the location
  bool isDayTime;
  WorldTime({this.url, this.location, this.flag});

  Future <void> getTime() async {
    try {
      Response response = await get(
          Uri.https('worldtimeapi.org', 'api/timezone/$url'));
      //print(response.body);
      Map data = jsonDecode(response.body);
      DateTime datetime = DateTime.parse(data['datetime']);
      String offsethr = data['utc_offset'].substring(1, 3);
      String offsetmin = data['utc_offset'].substring(4, 6);
      datetime = datetime.add(
          Duration(hours: int.parse(offsethr), minutes: int.parse(offsetmin)));
//    print(datetime);
//    print(offsethr);
//    print(offsetmin);
      //print(data);
      isDayTime = datetime.hour>6 && datetime.hour<20 ?true:false;
      time = DateFormat.jm().format(datetime);
    } catch (e) {
      time = 'Can not fetch time';
    }
  }
}