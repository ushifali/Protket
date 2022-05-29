import 'package:flutter/material.dart';
import 'package:protekt/on_login_pages/settings.dart';

class Audio_Record extends StatelessWidget {
  const Audio_Record({Key? key}) : super(key: key);

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

                        },
                      )),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Audio Record',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'SignikaNegative',
                        letterSpacing: 3.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/mike.png',
                height: 150,
              ),
              SizedBox(
                height: 30,
              ),

              Align(
                alignment: Alignment.center,
                child: Text(
                  '00: 00',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'SignikaNegative',
                    letterSpacing: 3.0,
                  ),
                ),
              ),

              SizedBox(
                height: 30,
              ),

              Row(children: [
                SizedBox(
                  width: 80,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.play_arrow),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      fixedSize: const Size(60, 55),
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
                  width: 60,
                ),
                ElevatedButton(
                  onPressed: () {

                  },
                  child: Icon(Icons.stop, color: Colors.black),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.amber[300],
                      fixedSize: const Size(60, 55),
                      side: BorderSide(color: Colors.black),
                      //do not give padding buttons wont be of same size
                      // padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      textStyle: TextStyle(
                        fontSize: 22,
                        fontFamily: 'SignikaNegative',
                        //fontWeight: FontWeight.bold
                      )),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
