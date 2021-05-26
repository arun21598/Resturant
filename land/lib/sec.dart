import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:land/main.dart';
import 'package:land/third.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';


class SecPage extends StatefulWidget {
  //  User user;
  // HomesPage({Key key,@required user}) : super(key: key);

  @override
  SecPageState createState() => SecPageState();
}


class SecPageState extends State<SecPage> {



 
  clearTextInput(){
 
    name_Controller.clear();
    mob_Controller.clear();
    mail_Controller.clear();
 
  }
 

SharedPreferences logindata;
bool newuser;
 
  TextEditingController name_Controller = TextEditingController();
  TextEditingController mob_Controller = TextEditingController();
  TextEditingController mail_Controller = TextEditingController();

  @override
  void initState(){
    super.initState();
   already_login();

  }

  void already_login()async{
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login')??true);

    print(newuser);
    if (newuser == false){
      // Navigator.pushReplacement(context, new MaterialPageRoute(builder:(context)=> ThirdPage()));
    }
  }

@override
Void dispose(){
  name_Controller.dispose();
  mob_Controller.dispose();
  mail_Controller.dispose();
  super.dispose();
}

 
  @override
  Widget build(BuildContext context) {


    
    return Scaffold(
    body: Container(
        // decoration: BoxDecoration(
        //         image: const DecorationImage(
        //           //  image: AssetImage("assets/images/white_car.png"),
        //           fit: BoxFit.fill,
        //         ),
        //       ),
          
      child:SingleChildScrollView(
        child:  Center(
             
          child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 50,),
        
        SizedBox(
                height: 100,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      hintText: 'Enter Valid name'),
                          validator:(String value){
                      if(value.isEmpty)
                      {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    controller: name_Controller,
                ),
              ),
               
        SizedBox(
                height: 10,
              ),
                  Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contact Number',
                      hintText: 'Enter Mobile Number'),
                          validator:(String value){
                      if(value.isEmpty)
                      {
                        return 'Please Enter Mobile Number';
                      }
                      return null;
                    },
                    controller: mob_Controller,
                ),
              ),
      SizedBox(
                height: 10,
              ),
               Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id'),
                  validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please a Enter';
                      }
                      if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                    controller: mail_Controller,
                ),
              ),
               Container(
                padding: EdgeInsets.all(20),
                child:   RaisedButton(
                  // onPressed: save,
                      color:  Color(0xFF0077ED),
                       child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                     onPressed: () {
                      
                       String name = name_Controller.text;
                       String mob = mob_Controller.text;
                       String mail = mail_Controller.text;
                       

                       if(name != '' &&mob!=''){
                         print('Sucess');
                         logindata.setBool('submit', false);
                         logindata.setString('name',name);
                         logindata.setString('mob',mob);
                         logindata.setString('mail',mail);

                         Navigator.push(context,MaterialPageRoute(builder: (context) => ThirdPage()));
                          clearTextInput();

                       }

                       
                     },
                     
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

