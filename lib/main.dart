import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepOrange),
      home: Scaffold(
        appBar: AppBar(title: Text('Kerill app'), 
          backgroundColor: Colors.blueAccent,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize:  50,
          ),
          
        ),
        body: Center(
          child: Container(
            color: Colors.deepOrangeAccent,
            child: Text('Application'),
          ),

          /*IconButton.outlined(
            color: Colors.green,
            focusColor: Colors.green,
            icon: Icon(Icons.access_alarm),
            onPressed: (){}, 
            ),*/
        ),
      ),
    );
  }

}