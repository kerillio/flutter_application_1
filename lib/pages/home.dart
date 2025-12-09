import 'package:flutter/material.dart';

class Home extends StatefulWidget {
 const Home({Key? key}) : super(key: key);

 @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String? _userToDo;
  List todoList = ['buy milk', 'wash dishes'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('TODO'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(todoList[index]),
                child: Card(
                  child: ListTile(
                      title: Text(todoList[index]),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            todoList.removeAt(index);
                          });
                        },
                        icon: Icon(
                         Icons.delete,
                         color: Colors.amber,
                        )),
                  ),
                ),
              onDismissed: (direction){
                  setState(() {
                    todoList.removeAt(index);
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
                          todoList.add(_userToDo);
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