import 'package:flutter/material.dart';
import 'additional_designs/custom_clippers.dart';
import 'additional_designs/clipper_shadows.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.indigo[400],
      ),
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
                clipper: BigClipper(),
                child: Container(
                  color: Colors.indigo[200],
                ),
              ),

              ClipShadowPath(
                shadow: const BoxShadow(
                  color: Colors.black,
                  offset: Offset(4, 4),
                  blurRadius: 0.1,
                  spreadRadius: 1,
                ),
                clipper: SmallClipper(),
                child: Container(
                  color: Colors.indigo[400],
                ),
              ),
              // SizedBox(height: 160.0),

              Align(
                alignment: Alignment(0.0, -0.6),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 42.0,
                    fontFamily: 'SignikaNegative',
                  ),
                ),
              ),

              Align(
                alignment: Alignment(0, -0.4),
                child: Container(
                  width: 320.0,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your Email Address',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment(0, -0.2),
                child: Container(
                  width: 320.0,
                  child: TextFormField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter password',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment(0.0, 0.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen()
                      ),
                    );
                  },
                  child: Text(
                    'Login',
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
              ),

              //SizedBox(height: 260.0),
              Align(
                alignment: Alignment(0, 0.2),
                child: Text(
                  '---------- OR ----------',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: 'SignikaNegative',
                  ),
                ),
              ),

              Align(
                alignment: Alignment(0.0, 0.4),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Login Using Google',
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
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.indigo[400],
    );
  }
}
