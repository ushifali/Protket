import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../components/navigation_bar.dart';
import 'homepage.dart';

class Fake_Call extends StatefulWidget {
  @override
  State<Fake_Call> createState() => _Fake_CallState();
}

class _Fake_CallState extends State<Fake_Call> {
  Duration duration = Duration();
  Timer ?timer;

  @override
  void initState()
  {
    super.initState();

    startTimer();
  }

  void addTime()
  {
    final addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds +addSeconds;
      duration = Duration(seconds: seconds);
    });
  }

  void startTimer()
  {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }
  @override
  Widget build(BuildContext context) {
       String twoDigits(int n) => n.toString().padLeft(2,'0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Scaffold(
        backgroundColor: Colors.black,
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
                          onPressed: () {},
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
                  'assets/images/profile.png',
                  height: 150,
                ),
                Text("Emelia",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'SignikaNegative',
                      letterSpacing: 3.0,
                    )),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '$minutes:$seconds',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
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
                    width: 38,
                  ),
                  Column(children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.pause_circle_outline,
                        size: 50,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,

                        //do not give padding buttons wont be of same size
                        // padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Hold",
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),
                  SizedBox(
                    width: 15,
                  ),
                  Column(children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.stop,
                        size: 50,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,

                        //do not give padding buttons wont be of same size
                        // padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Record",
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),
                  SizedBox(
                    width: 15,
                  ),
                  Column(children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        size: 50,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,

                        //do not give padding buttons wont be of same size
                        // padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Add Call",
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),
                ]),
                SizedBox(
                  height: 40,
                ),
                Row(children: [
                  SizedBox(
                    width: 38,
                  ),
                  Column(children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.account_circle_sharp,
                        size: 50,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,

                        //do not give padding buttons wont be of same size
                        // padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Contacts",
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),
                  SizedBox(
                    width: 15,
                  ),
                  Column(children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.notes,
                        size: 50,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,

                        //do not give padding buttons wont be of same size
                        // padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Notes",
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),
                  SizedBox(
                    width: 15,
                  ),
                  Column(children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.mic_none_rounded,
                        size: 50,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,

                        //do not give padding buttons wont be of same size
                        // padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Mute",
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),
                ]),
                SizedBox(
                  height: 55,
                ),
                Row(children: [
                  SizedBox(
                    width: 38,
                  ),
                  Column(children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.keyboard_outlined,
                        size: 50,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,

                        //do not give padding buttons wont be of same size
                        // padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Keypad",
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),
                  SizedBox(
                    width: 15,
                  ),
                  Column(children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BottomBar()),
                        );
                      },
                      child: Icon(
                        Icons.call_end,
                        size: 50,
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red, shape: StadiumBorder()
                          //do not give padding buttons wont be of same size
                          // padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                          ),
                    ),
                  ]),
                  SizedBox(
                    width: 15,
                  ),
                  Column(children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.volume_up_outlined,
                        size: 50,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,

                        //do not give padding buttons wont be of same size
                        // padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Volume",
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),
                ]),
              ],
            ),
          ),
        ));
  }
}
