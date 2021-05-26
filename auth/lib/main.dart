import 'package:auth/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'hotel.dart';

// // void main() => runApp(MyApp());

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(scaffoldBackgroundColor: Colors.blueGrey),
      home: MyLoginPage(),
    );
  }
}




class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String email, password;

final formKey = new GlobalKey<FormState>();


  clearTextInput(){
    _email.clear();
    pass.clear();
  }


  TextEditingController _email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor:Colors.blueGrey ,
        title: Text("Assault Sethu Restaurent"),
      ),
      body: Container(
      child:SingleChildScrollView(
        child: ModalProgressHUD(
          inAsyncCall: showProgress,
          child:Center(
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
                "LOGIN APP",
            style: const TextStyle(
                color:   Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
                fontStyle:  FontStyle.normal,
                fontSize: 29.0
            )
              ),
              SizedBox(
                height: 120.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
              child:TextFormField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.start,
                onChanged: (value) {
                  email = value; // get value from TextField
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
                     
                  validator: MultiValidator([
                    RequiredValidator(errorText: "* Required"),
                    EmailValidator(errorText: "Enter valid email id"),
                  ]),
                  controller:_email,
              ),),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child:TextFormField(
                obscureText: true,
                textAlign: TextAlign.start,
                onChanged: (value) {
                  password = value; //get value from textField
                },
                       decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(      
                     
                            borderSide: BorderSide(color: Colors.black),   
                            ), 
                            focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  ), 
                      border: OutlineInputBorder(),
                      // labelText: 'Password',
                      hintText: 'Enter secure password'),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "* Required"),
                    MinLengthValidator(6,
                        errorText: "Password is incorrect"),
                    MaxLengthValidator(15,
                        errorText:
                            "Password should not be greater than 15 characters")
                 
                  ]),
                  controller: pass,
              ),),
              SizedBox(
                height: 20.0,
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
                      final newUser = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);

                      print(newUser.toString());
                       

                      if (newUser != null) {
                        Fluttertoast.showToast(
                            msg: "Login Sucessfull",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.purple,
                            textColor: Colors.white,
                            fontSize: 16.0);


                             Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => hotelInfo()),);

                            
                        setState(() {
                          showProgress = false;
                        });
                      }
                      clearTextInput();
                  }
                 
                 
                    // } catch (e) {}
                  },
                  minWidth: 200.0,
                  height: 45.0,
                  child: Text(
                    "Login",
                    style:
                        TextStyle(color: Colors.white,fontWeight: FontWeight.w500, fontSize: 20.0),
                  ),
                ),
              ),),
              SizedBox(
                height: 15,
              ),
               GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                child: Text(
                  "New User? Sign up",
                  style: TextStyle(
                      color: Colors.white54, fontWeight: FontWeight.w900),
                ),
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
      ),
    );
  }
}