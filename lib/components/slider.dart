import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class Slide extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.settings,
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Enable SOS on shake",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        LiteRollingSwitch(
                          value: false,
                          textOn: "On",
                          textOff: "Off",
                          colorOn: Colors.green,
                          colorOff: Colors.red,
                          iconOn: Icons.done,
                          iconOff: Icons.close,
                          textSize: 18,
                          onChanged: (bool position) {
                            print("Button is $position");
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height:20,
                    ),

                    Row(
                      children: <Widget>[
                        Text("Enable live location sharing",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        LiteRollingSwitch(
                          value: false,
                          textOn: "On",
                          textOff: "Off",
                          colorOn: Colors.green,
                          colorOff: Colors.red,
                          iconOn: Icons.done,
                          iconOff: Icons.close,
                          textSize: 18,
                          onChanged: (bool position) {
                            print("Button is $position");
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height:20,
                    ),
                    Row(
                      children: <Widget>[
                        Text("Theme",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}