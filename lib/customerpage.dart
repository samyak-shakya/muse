import 'package:login_page_day_23/homepage.dart';
import 'package:flutter/material.dart';
import 'package:login_page_day_23/loginhome.dart';
import 'package:login_page_day_23/profilepage.dart';
import 'package:login_page_day_23/settingpage.dart';
import '';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Bar',
      home: CustomerHomePage(),
    );
  }
}

class CustomerHomePage extends StatefulWidget {
  CustomerHomePage({Key key}) : super(key: key);

  @override
  _CustomerHomePageState createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  List<String> _choice = ["Home","Profile","Settings"];
  int _seletedItem = 0;
  var _pages = [Home(), ProfileScreen(), SettingPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
        (title: Text
        (_choice[_seletedItem],
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25 ),
      ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginHome()));
            },
          )
        ],
      backgroundColor: Colors.pinkAccent,
      ),
      body: Center(child: _pages[_seletedItem],),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pinkAccent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.white,), title: Text('Profile')),
          BottomNavigationBarItem(icon: Icon(Icons.settings,color: Colors.white,), title: Text('Settings'))
        ],
        currentIndex: _seletedItem,
        onTap: (index){
          setState(() {
            _seletedItem = index;
          });
        },
      ),
    );
  }
}