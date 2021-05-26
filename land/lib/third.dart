import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';



class ThirdPage extends StatefulWidget {
  //  User user;
  // HomesPage({Key key,@required user}) : super(key: key);

  @override
  ThirdPageState createState() => ThirdPageState();
}
class ThirdPageState extends State<ThirdPage> {




 
  SharedPreferences logindata;
  String name,mob,mail;

  
  TextEditingController name_Controller = TextEditingController();
  TextEditingController mob_Controller = TextEditingController();
  TextEditingController mail_Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    initial();
  }
  void initial() async {
    SharedPreferences logindata = await SharedPreferences.getInstance();
    setState(() {
      name = logindata.getString('name');
      print(name);
       mob = logindata.getString('mob');
       print(mob);
        mail = logindata.getString('mail');
        print(mail);
    });
  }

Future<void> remove_data() async {
  SharedPreferences logindata = await SharedPreferences.getInstance();
  await logindata.clear();
  print("Suckk");
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar:   new AppBar(
//         centerTitle: true,
//        backgroundColor: Color(0xFF0077ED),
//         elevation: 0.0,
//         actions: [
//           PopupMenuButton(
//     // child: Text('click here')
//     icon: const Icon(Icons.menu),
//   itemBuilder: (context) => [
//                   PopupMenuItem(
//                     child: Text("Fill Details"),
//                     value: 1,
                    
//                   ),
//                   PopupMenuItem(
//                     child: Text("Show Details"),
//                     value: 2,
//                   )
//                 ]
// ),
//         ],
//         title: new Text(
//             "TRANSPARENT APP",
//             style: const TextStyle(
//                 color:  const Color(0xffffffff),
//                 fontWeight: FontWeight.w500,
//                 fontFamily: "Roboto",
//                 fontStyle:  FontStyle.normal,
//                 fontSize: 19.0
//             )),
//       ),
      //  body: SingleChildScrollView(
      //     child: Container(
      //         //margin:EdgeInsets.only(top:ScreenUtil.statusBarHeight),
      //         child: Column(
      //   children: <Widget>[
      //     Padding(
      //       padding: EdgeInsets.all(30),
      //       child: Text(name, style: TextStyle(fontSize: 18)
      //       ),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.all(30),
      //       child: Text(mob, style: TextStyle(fontSize: 18)),
      //     ),
      //      Padding(
      //       padding: EdgeInsets.all(30),
      //       child: Text(mail, style: TextStyle(fontSize: 18)),
      //     ),
      //         Padding(
      //       padding: EdgeInsets.all(30),
      //       child: RaisedButton(
      //         onPressed: ()  {
      //           // logindata.setBool('login', true);
      //           // logindata = await SharedPreferences.getInstance();
      //           // logindata.remove("$name");
      //           // setState(() {
      //           // remove_data();
      //           // },
      //           // );
      //           // print("fucc");
      //           // Navigator.pushReplacement(context,
      //           //     new MaterialPageRoute(builder: (context) => MyLoginPage()));
      //         },
      //         child: Text('LogOut'),
      //       ),
      //        ),
      //   ],
             
      // ))),
       body: SingleChildScrollView(
        padding: const EdgeInsets.all(150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: <Widget>[
            // Center(
              // child: 
              SizedBox(
                height: 100,
              ),
              Text(
                 '$name',
                //  '$mob',
                  // '$mail',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
               Text(
                //  '$name',
                 '$mob',
                  // '$mail',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
               Text(
                //  '$name',
                //  '$mob',
                  '$mail',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),

              SizedBox(
                height:30
              ),
            // ),
                 RaisedButton(
              onPressed: ()  {
                // logindata.setBool('login', true);
                // logindata = await SharedPreferences.getInstance();
                // logindata.remove("$name");
                // setState(() {
                remove_data();
                // },
                // );
                // print("fucc");
                // Navigator.pushReplacement(context,
                //     new MaterialPageRoute(builder: (context) => MyLoginPage()));
              },
              child: Text('Delete'),
            )
       
          ],
          
        ),
        
      ),
      
    );
  }
}
