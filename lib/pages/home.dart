import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
  @override
  Widget build(BuildContext context) {
    data=data.isEmpty?ModalRoute.of(context).settings.arguments:data;
    //print(data);
    String bgImg= data['isDayTime']?'day.png':'night.png';
    Color bgColor= data['isDayTime']?Colors.blue:Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage('assets/$bgImg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
              child: Column(
                children: [
                  TextButton.icon(
                      onPressed: () async{
                        dynamic result=await Navigator.pushNamed(context, '/choose_location');
                        setState(() {
                          data={};
                          data={
                            'location':result['location'],
                            'time':result['time'],
                            'flag':result['flag'],
                            'isDayTime':result['isDayTime'],
                          };
                        });
                      },
                    style: TextButton.styleFrom(//to change the default color of TextButton and its icon
                      primary: Colors.black,
                    ),
                      label: Text('Edit location',
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),),
                      icon:Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                      ),
                  ),
                  SizedBox(height:20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),),
                    ],
                  ),
                  SizedBox(height:20.0),
                  Text(data['time'],
                  style:TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
