import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgimage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgcolor = data['isDaytime'] ? Colors.pink : Colors.blue[900];
    // Color textcolor = data['isDaytime'] ? Colors. : Colors.indigo;


    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage('assets/$bgimage'),
          fit: BoxFit.cover,
          ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,150,0,0),
            child: Column(
              children: <Widget>[

                SizedBox(height: 20,),
                TextButton(onPressed: () async{
                  dynamic result =await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'location' : result['location'],
                      'flag' : result['flag'],
                      'time' :  result['time'],
                      'isDaytime'  :  result['isDaytime']
                    };

                  });
                },
                  child: Text(data['location'],
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        data['time'],
                        style: TextStyle(
                            fontSize: 78.0,
                            color: Colors.white
                        )
                    ),
                  ],
                ),
              ],
            ),

            ),
          ),
        ),
      );

  }
}