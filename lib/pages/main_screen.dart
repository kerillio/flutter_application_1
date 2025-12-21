import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key :key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Card Holder'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text('Main screeen', style: TextStyle(color: Colors.black),),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacementNamed(context, '/cards');
            }, child: Text('Перейти далее')),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacementNamed(context, '/fileDemo');
            }, child: Text('FILE IO'))
          ],
        )
    );}
}