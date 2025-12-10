import 'package:flutter/material.dart';

class Home extends StatefulWidget {
 const Home({Key? key}) : super(key: key);

 @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String? _userToDo;
  List cardList = ['X5Group'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Card Holder'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: cardList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(cardList[index]),
                child: Card(
                  child: Container(
                    child: ListTile(
                      leading: Image( image: AssetImage('assets/${cardList[index]}.png')),
                      trailing: IconButton(
                          onPressed: () {
                            showDialog(context: context, builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Delete?'),
                                actions: [
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(onPressed: () {
                                          setState(() {
                                            cardList.removeAt(index);
                                          });
                                          Navigator.of(context).pop();
                                        },
                                            child: Text('Yes')),
                                        ElevatedButton(onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                            child: Text('No')),

                                      ])

                                ],
                              );
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.amber,
                          )),
                    ),
                  ),
                ),
              onDismissed: (direction){
                  setState(() {
                    cardList.removeAt(index);
                  });
              },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    title: Text('Add new card'),
                    content: TextField(
                      onChanged: (String value){
                        _userToDo = value;
                      },
                    ),
                    actions: [
                      ElevatedButton(onPressed: (){
                        setState(() {
                          cardList.add(_userToDo);
                        });
                        Navigator.of(context).pop();
                      }, child: Text('add'))
                    ],
                  );
                });
          },
        backgroundColor: Colors.grey[300],
        child: Icon(
          Icons.add_card,
          color: Colors.amber[600],

        ),
      ),
    );
  }
}