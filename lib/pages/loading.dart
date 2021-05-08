import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
//  String time='loading';
  void setupWorldTime() async{
    WorldTime instance= WorldTime(location:'Kolkata',url:'Asia/Kolkata',flag:'India.png');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'time':instance.time,
      'flag':instance.flag,
      'isDayTime':instance.isDayTime,
    });
//    print(instance.time);
//    setState(() {
//      time=instance.time;
//    });
  }

  @override
  void initState() {

    super.initState();
    //print('Init state ran');
    setupWorldTime();
    //print('statement 1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SpinKitFadingCube(
        color: Colors.white,
        size: 80.0,
      ),
    );
  }
}
