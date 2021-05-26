import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'main.dart';

// import 'login.dart';

// void main() => runApp(MyApp());


// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;

  final formKey = new GlobalKey<FormState>();


  TextEditingController _email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor:Colors.blueGrey ,
        title: Text("Madurai Parotta"),
      ),
      body:Container(
       child:SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Form(
            key: formKey,
             child:Container(


            child:new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              
                  SizedBox(
                    height:200
                  ), 

                Text(
                "REGISTRATION ",
            style: const TextStyle(
                color:   Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
                fontStyle:  FontStyle.normal,
                fontSize: 29.0
            )
              ),
              SizedBox(
                height: 100.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
              child:TextFormField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.start,
                onChanged: (value) {
                  email = value; //get the value entered by user.
                },
                 decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(      
                     
                            borderSide: BorderSide(color: Colors.black),   
                            ), 
                            focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  ), 
                      border: OutlineInputBorder(),
                      // labelText: 'Email',
                      hintText: 'Enter valid email id '
                    
                      ),
                  validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please a Enter';
                      }
                      if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                        return 'In-valid Email id';
                      }
                      return null;
                    },
                    //  onSaved: (val) => email = val,
                     controller: _email,
              ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
               padding: EdgeInsets.symmetric(horizontal: 20),
              child:TextFormField(
                obscureText: true,
                textAlign: TextAlign.left ,
                onChanged: (value) {
                  password = value; //get the value entered by user.
                },
                decoration: InputDecoration(
                   enabledBorder: UnderlineInputBorder(      
                     
                            borderSide: BorderSide(color: Colors.black),   
                            ), 
                            focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  ), 
                    hintText: "Enter your Password",
                    border: OutlineInputBorder(
                        // borderRadius: BorderRadius.all(Radius.circular(32.0))
                        )),
                          validator: MultiValidator([
                    RequiredValidator(errorText: "* Required"),
                    MinLengthValidator(6,
                        errorText: "Password should be atleast 6 characters"),
                    MaxLengthValidator(15,
                        errorText:
                            "Password should not be greater than 15 characters")
                  ]),
                  controller: pass,
              ),),
              SizedBox(
                height:20.0
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(      
                     
                            borderSide: BorderSide(color: Colors.black),   
                            ), 
                            focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  ), 
                      border: OutlineInputBorder(),
                      // labelText: 'Confirm Password',
                      hintText: 'Enter Confirm password'),
                  validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please a Re-enter Password';
                      }
                       print(pass.text);
                      print(confirmpassword.text);
                      if(pass.text!=confirmpassword.text){
                        return "Password does not match";
                      }
                      return null;
                    },
                   
                  controller:confirmpassword,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                child:Material(
                elevation: 5,
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(32.0),
                child: MaterialButton(
                  onPressed: () async {
                    final form = formKey.currentState;
                  if(form.validate()){
                    setState(() {
                      showProgress = true;
                    });
                    // try {
                      
                      final newuser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);

                      if (newuser != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyLoginPage()),
                        );

                        setState(() {
                          showProgress = false;
                        });
                        
                      }
                      }
                    // } catch (e) {}
                  },
                  minWidth: 200.0,
                  height: 45.0,
                  child: Text(
                    "Register",
                    style:
                        TextStyle(color: Colors.white,fontWeight: FontWeight.w500, fontSize: 20.0),
                  ),
                ),
              ),),
              SizedBox(
                height: 15.0,
              ),
             
            ],
          ),
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