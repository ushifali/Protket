import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'additional_designs/custom_clippers.dart';
import 'additional_designs/clipper_shadows.dart';

class OpenScreen extends StatelessWidget {
  const OpenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //with absence of appbar , the contents of body start from the top
      //the problem here is - the top starts out of the mobile height
      //so few top contents are at the top are outside to prevent this safeArea ia used

      //also do not use Expanded it messes up button also flexible
      //both arent suitable for responsiveness
      resizeToAvoidBottomInset: false,
      body: SafeArea(

        child: Center(

          child: Stack(
            children: <Widget>[


              ClipShadowPath(
                shadow: const BoxShadow(
                  color: Colors.black,
                  offset: Offset(4, 4),
                  blurRadius: 0.1,
                  spreadRadius: 1,
                ),
                clipper: SmallClipper(),
                child: Container(
                  color: Colors.yellow[200],
                ),
              ),

              Align(
                  alignment: Alignment(0.0, -0.3),
                  child: Image.asset('assets/images/walkhomegif.gif')

              ),
              

              Align(
                alignment: Alignment(0.0, -0.8),
                child: Text(
                  'Protekt',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 60.0,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'SignikaNegative',
                    letterSpacing: 3.0,

                  ),
                ),
              ),

              Align(
                alignment: Alignment(0.0, -0.63),
                child: Text(
                  'Better Safe than Sorry',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: 'SignikaNegative',
                  ),
                ),
              ),

              //SizedBox(height: 100.0),

              Align(
                alignment: Alignment(0, 0.3),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  RegisterScreen()),
                    );
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    fixedSize: const Size(240, 55),
                    // padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 22,
                      fontFamily: 'SignikaNegative',
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),

              //SizedBox(height: 13.0),

              Align(
                alignment: Alignment(0.0, 0.48),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: Text(
                    'Login',
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

              //SizedBox(height: 260.0),

              Align(
                alignment: Alignment(0, 0.85),
                child: Text(
                  'When Safety is First',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'SignikaNegative_Light',
                  ),
                ),
              ),

              Align(
                alignment: Alignment(0, 0.9),
                child: Text(
                  'You Last',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'SignikaNegative_Light',
                  ),
                ),
              ),

              //SizedBox(height: 13.0),

              // Align(
              //   alignment: Alignment(0, 0.97),
              //   child: Text(
              //     'Protekt',
              //     style: TextStyle(
              //       fontSize: 22.0,
              //       fontFamily: 'SignikaNegative',
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.yellow[100],
    );
  }
}
