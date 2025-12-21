import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/class lib/menuOpen.dart';
import '/firebase_options.dart';

class Home extends StatefulWidget {
 const Home({super.key});

 @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {


  void initFirebase () async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }


  String? _userToDo;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Card Holder'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu_outlined),
            onPressed: () {
              menuOpen(context);
            },)
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('card').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>? snapshot){
          if (!snapshot!.hasData) return Text ('No data');
          return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key(snapshot.data?.docs[index].get('card')),
                  child: Card(
                    child: Container(
                      child: ListTile(
                        leading: Text(snapshot.data?.docs[index].get('card')),
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
                                            snapshot.data!.docs.removeAt(index);
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
                    snapshot.data?.docs.removeAt(index);
                  },
                );
              }
          );
        },
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

                        FirebaseFirestore.instance.collection('card').add(
                            {'card': _userToDo});
                        
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