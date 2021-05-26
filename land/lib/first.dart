import 'package:flutter/material.dart';



class FirstPage extends StatefulWidget {
  //  User user;
  // HomesPage({Key key,@required user}) : super(key: key);

  @override
  FirstPageState createState() => FirstPageState();
}
class FirstPageState extends State<FirstPage> {



@override
  Widget build(BuildContext context) {
    return Scaffold(
      // we won't use appBar here
      // appBar: AppBar(
      //   title: Text("Full screen page"),
      //   backgroundColor: Colors.purple,
      // ),
      // might need to set this flag, 
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        top: false,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1517030330234-94c4fb948ebc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1275&q=80'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text('Sixth Circle',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }

}
