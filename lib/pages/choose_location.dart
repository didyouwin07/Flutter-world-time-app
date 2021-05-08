import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List <WorldTime> locations=[
    WorldTime(location:'Seoul',url:'Asia/Seoul',flag:'south_korea.png'),
    WorldTime(location:'Egypt',url:'Egypt',flag:'egypt.png'),
    WorldTime(location:'Berlin',url:'Europe/Berlin',flag:'germany.png'),
    WorldTime(location:'Athens',url:'Europe/Athens',flag:'greece.png'),
    WorldTime(location:'Jakarta',url:'Asia/Jakarta',flag:'indonesia.png'),
    WorldTime(location:'Nairobi',url:'Africa/Nairobi',flag:'kenya.png'),
    WorldTime(location:'London',url:'Europe/London',flag:'uk.png'),
    WorldTime(location:'New York',url:'America/New_York',flag:'usa.png'),
  ];

  void updatetime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location':instance.location,
      'time':instance.time,
      'flag':instance.flag,
      'isDayTime':instance.isDayTime,
    });
  }


  @override
  Widget build(BuildContext context) {
    //print('Statement 2');
    //print('Build ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
                onTap: (){
                  updatetime(index);
                },
                title: Text(locations[index].location),
              ),
            ),
          );
        },
      ),
    );
  }
}
