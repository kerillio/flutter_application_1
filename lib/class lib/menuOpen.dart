import 'package:flutter/material.dart';



 void menuOpen(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Menu'),
                backgroundColor: Colors.amber,
                centerTitle: true,
              ),
              body: Column (
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                  }, child: Text('Main screen')),
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(context, '/cards', (route) => false);
                  }, child: Text('Cards')),
                  Padding(padding: EdgeInsets.only(left: 15)),
                  Text('Simple menu')
                ],
              )
          );
        })
    );
  }