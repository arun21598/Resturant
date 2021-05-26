import 'package:flutter/material.dart';
import 'package:land/sec.dart';
import 'package:land/third.dart';

import 'first.dart';



class HomesPage extends StatefulWidget {
  HomesPage({Key key}) : super(key: key);

  @override
  HomesPageState createState() => HomesPageState();
}

class HomesPageState extends State<HomesPage> {

  
  int _selectedIndex = 0;
  final List<Widget> _options = <Widget>[
    new FirstPage(),
    new SecPage(),
    new ThirdPage(),
   
  ];
   void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   new AppBar(
        centerTitle: true,
       backgroundColor: Color(0xFF0077ED),
        elevation: 0.0,
        actions: [
          PopupMenuButton(
    // child: Text('click here')
    icon: const Icon(Icons.menu),
  itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("Fill Details"),
                    value: 1,
                    
                  ),
                  PopupMenuItem(
                    child: Text("Show Details"),
                    value: 2,
                  )
                ]
),
        ],
        title: new Text(
            "TRANSPARENT APP",
            style: const TextStyle(
                color:  const Color(0xffffffff),
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
                fontStyle:  FontStyle.normal,
                fontSize: 19.0
            )),
      ),
      body:  Center(
        
        child: _options.elementAt(_selectedIndex),
      ),
       drawer: Drawer(

        child: ListView(

          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF0077ED),
              ),
              child: Text('List'),
            ),
            ListTile(
              title: Text('Help'),
              onTap: () {
              
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
              
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
         floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        
        child: const Icon(Icons.navigation),
        backgroundColor: Color(0xFF0077ED),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.first_page),
                label: 'page',
                backgroundColor: Color(0xFF0077ED)
            ),
             BottomNavigationBarItem(
                icon: Icon(Icons.app_registration),
                label: 'fill',
                backgroundColor:  Color(0xFF0077ED)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.details),
                label: 'show',
                backgroundColor: Color(0xFF0077ED)
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          iconSize: 40,
          onTap: _onItemTap,
          elevation: 5
      ),
        
      
    );
  }
}