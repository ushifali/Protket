import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:protekt/on_login_pages/get_your_loaction.dart';
import 'package:protekt/on_login_pages/settings.dart';

import 'Audio_Record.dart';
import 'fake_call.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Text('Messgaes Screen'),
    Text('Profile Screen'),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                      alignment: Alignment(1, 0),
                      child: IconButton(
                        iconSize: 30,
                        icon: Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsPage()),
                          );
                        },
                      )),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Protekt',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'SignikaNegative',
                        letterSpacing: 3.0,
                      ),
                    ),
                  ),
                ],
              ),
              Image.asset('assets/images/walkhomegif.gif'),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    'Helping people get to their destination safely',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 30,
                      fontFamily: 'SignikaNegative',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    'Features',
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'SignikaNegative',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),


              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Fake_Call()),
                  );
                },
                child: Text(
                  'Make Fake Calls And Record Audio ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    fixedSize: const Size(320, 55),
                    side: BorderSide(color: Colors.black),
                    //do not give padding buttons wont be of same size
                    // padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 22,
                      fontFamily: 'SignikaNegative',
                      //fontWeight: FontWeight.bold
                    )),
              ),


              SizedBox(
                height: 20,
              ),


              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CurrentLocationScreen()),
                  );
                },
                child: Text(
                  'Get Live Location',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.amber[300],
                    fixedSize: const Size(320, 55),
                    side: BorderSide(color: Colors.black),
                    //do not give padding buttons wont be of same size
                    // padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 22,
                      fontFamily: 'SignikaNegative',
                      //fontWeight: FontWeight.bold
                    )),
              ),

            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: Icon(Icons.location_on_rounded, color: Colors.black,),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.vertical(top: Radius.elliptical(100, 100),bottom: Radius.circular(100),
                ),
            ),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const CurrentLocationScreen()),
          );
        },

      ),
    );
  }
}
