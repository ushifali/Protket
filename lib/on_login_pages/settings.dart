import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:protekt/firebase_components/firebase_signin.dart';
import 'package:protekt/login.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.indigo,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [

            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.indigo,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account Details",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],

            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Name",
              style: TextStyle(fontSize: 22,fontFamily: 'SignikaNegative',),
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              "${FirebaseAuth.instance.currentUser!.displayName}",
              style: TextStyle(fontSize: 22, fontFamily: 'SignikaNegative',color: Colors.grey),
            ),

            SizedBox(
              height: 20,
            ),

            Text(
              "Registered Email:",
              style: TextStyle(fontSize: 22, fontFamily: 'SignikaNegative',),
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              "${FirebaseAuth.instance.currentUser!.email}",
              style: TextStyle(fontSize: 22, fontFamily: 'SignikaNegative',color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.indigo,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Advanced Settings",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),


              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),

            Row(
              children: [
                Text("Enable SOS on shake",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'SignikaNegative',
                    color: Colors.grey
                  ),
                ),
                SizedBox(
                  width: 60,
                ),

                Container(
                  height: 40,
                  child: LiteRollingSwitch(
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
                ),
              ],
            ),


            SizedBox(
              height: 30,
            ),

            Row(
              children: [
                Text("Enable live location sharing",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'SignikaNegative',
                    color: Colors.grey
                  ),
                ),

                SizedBox(
                  width: 20,
                ),


                Container(
                  height: 40,

                  child: LiteRollingSwitch(
                    value: false,
                    textOn: "On",
                    textOff: "Off",
                    colorOn: Colors.green,
                    colorOff: Colors.red[400],
                    iconOn: Icons.done,
                    iconOff: Icons.close,
                    textSize: 18,
                    onChanged: (bool position) {
                      print("Button is $position");
                    },
                  ),
                ),
              ],
            ),


            SizedBox(
              height: 30,
            ),

            Center(
              child: ElevatedButton(
                onPressed: () async{
                  await FirebaseServices().googleSignOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    fixedSize: const Size(240, 55),
                    side: BorderSide(color: Colors.black),
                    //do not give padding buttons wont be of same size
                    // padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 22,
                      fontFamily: 'SignikaNegative',
                      //fontWeight: FontWeight.bold
                    )),
              ),
            ),

          ],
        ),
      ),
    );
  }
}