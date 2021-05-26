import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreCRUDPage extends StatefulWidget {
  @override
  FirestoreCRUDPageState createState() {
    return FirestoreCRUDPageState();
  }
}

class FirestoreCRUDPageState extends State<FirestoreCRUDPage> {
  String id;
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  String name,behav;
  TextEditingController names = TextEditingController();

  Card buildItem(DocumentSnapshot doc) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Name: ${doc.data['name']}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Quality: ${doc.data['behav']}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () => updateData(doc),
                  child: Text('Change ', style: TextStyle(color: Colors.white)),
                  color: Colors.green,
                ),
                SizedBox(width: 8),
                FlatButton(
                  onPressed: () => deleteData(doc),
                  child: Text('Delete'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

   void clearText() {
    names.clear();
  }

  // TextFormField buildTextFormField() {
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       border: InputBorder.none,
  //       hintText: 'name',
  //       fillColor: Colors.grey[300],
  //       filled: true,
  //     ),
  //     validator: (value) {
  //       if (value.isEmpty) {
  //         return 'Please enter some text';
  //       }
  //     },
  //     onSaved: (value) => name = value,
  //   );
  // }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Qualities "),
      ),
      body: SingleChildScrollView(
        child: Form(
          // autovalidate: true, //check for validation while typing
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8),
                 child: TextFormField(
              decoration: InputDecoration(
        border: InputBorder.none,
        hintText: ' Name',
        fillColor: Colors.grey[300],
        filled: true,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some  Name';
        }
      },
      onSaved: (value) => name = value,
      controller: names,
            ),
              ),
      
              Container(
                 padding: EdgeInsets.all(8),
                 child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  
                  createData();
                  clearText();},
                child: Text('Add', style: TextStyle(color: Colors.white)),
                color: Colors.blueAccent,
              ),
              RaisedButton(
                onPressed: id != null ? readData : null,
                child: Text('Read', style: TextStyle(color: Colors.white)),
                color: Colors.grey[700],
              ),
          
            ],
                 ),
              ),
                    StreamBuilder<QuerySnapshot>(
            stream: db.collection('CRUD').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(children: snapshot.data.documents.map((doc) => buildItem(doc)).toList());
              } else {
                return SizedBox();
              }
            },
          )
            ],
            
          ),
        ),
      ),
    );
  }

 

  void createData() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      DocumentReference ref = await db.collection('CRUD').add({'name': '$name  ', 'behav': randombehav()});
      setState(() => id = ref.documentID);
      print(ref.documentID);
    }
  }

  void readData() async {
    DocumentSnapshot snapshot = await db.collection('CRUD').document(id).get();
    print(snapshot.data['name']);
  }

  void updateData(DocumentSnapshot doc) async {
    await db.collection('CRUD').document(doc.documentID).updateData({'behav': randombehav()});
  }


  void deleteData(DocumentSnapshot doc) async {
    await db.collection('CRUD').document(doc.documentID).delete();
    setState(() => id = null);
  }

  String randombehav() {
    final randomNumber = Random().nextInt(4);
    String behav;
    switch (randomNumber) {
      case 1:
        behav = 'Willpower';
        break;
      case 2:
        behav = 'Patience';
        break;
      case 3:
        behav = 'Being a control freak';
        break;
      default:
        behav = 'Impatience';
        break;
    }
    return behav;
  }
}























//  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firestore CRUD'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(8),
//         child:Column(
//         children: <Widget>[
//           Form(
//             key: _formKey,
//             child: TextFormField(
//               decoration: InputDecoration(
//         border: InputBorder.none,
//         hintText: 'name',
//         fillColor: Colors.grey[300],
//         filled: true,
//       ),
//       validator: (value) {
//         if (value.isEmpty) {
//           return 'Please enter some text';
//         }
//       },
//       onSaved: (value) => name = value,
//             ),
//           ),
          
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               RaisedButton(
//                 onPressed: createData,
//                 child: Text('Create', style: TextStyle(color: Colors.white)),
//                 color: Colors.green,
//               ),
//               RaisedButton(
//                 onPressed: id != null ? readData : null,
//                 child: Text('Read', style: TextStyle(color: Colors.white)),
//                 color: Colors.blue,
//               ),
//             ],
//           ),
//           StreamBuilder<QuerySnapshot>(
//             stream: db.collection('CRUD').snapshots(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Column(children: snapshot.data.documents.map((doc) => buildItem(doc)).toList());
//               } else {
//                 return SizedBox();
//               }
//             },
//           )
//         ],
//         ),
//       ),
//     );
//   }
