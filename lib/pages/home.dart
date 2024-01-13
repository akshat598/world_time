import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  //Object? parameters;

  @override
  Widget build(BuildContext context) {
    //parameters = parameters.ModalRoute.of(context)!.settings.arguments;
    //data = data.isNotEmpty ? ModalRoute.of(context)?.settings?.arguments : null;
    //data = data.isNotEmpty ? ModalRoute.of(context)?.settings?.arguments as Map<dynamic, dynamic> : null;
    //Map<dynamic, dynamic>? data;
    //...
    //data = data!.isNotEmpty ? ModalRoute.of(context)?.settings?.arguments as Map<dynamic, dynamic>? : null;
    //final data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments as object;
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    //set background
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            //decoration image allows you to apply a background image
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,//covers the whole bg
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
            child: Column(
              children: <Widget>[
                    ElevatedButton.icon(
                    onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data=result;
                    });

                    },
                    icon: Icon(
                        Icons.edit_location,
                        color: Colors.white70,
                    ),
                    label: Text(
                        'Edit Location',
                        style: TextStyle(
                         color: Colors.white70,
                        ),
                    ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        letterSpacing: 2.0,
                        fontSize: 28.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}