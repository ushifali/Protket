import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:protekt/components/navigation_bar.dart';
import 'package:protekt/firebase_components/firebase_signin.dart';
import 'package:protekt/on_login_pages/settings.dart';
import 'package:protekt/register.dart';
import 'package:provider/provider.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context ,snapshot){
          if(snapshot.hasData){

            //its logged in
            return BottomBar();

          }

          if(snapshot.connectionState == ConnectionState.waiting)
            {
              return Container();


            }

          return Container(

            child: SafeArea(
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Align(
                        alignment: Alignment(0.0, -0.6),
                        child: Image.asset(
                          'assets/images/register.gif',
                          height: 200,
                          width: 200,
                        )),
                    // ClipShadowPath(
                    //   shadow: const BoxShadow(
                    //     color: Colors.black,
                    //     offset: Offset(1, 0),
                    //
                    //
                    //   ),
                    //   clipper: BigClipper(),
                    //   child: Container(
                    //     color: Colors.yellow[300],
                    //   ),
                    // ),

                    // ClipShadowPath(
                    //   shadow: const BoxShadow(
                    //     color: Colors.black,
                    //     offset: Offset(0,1),
                    //
                    //   ),
                    //   clipper: SmallClipper(),
                    //   child: Container(
                    //     color: Colors.yellow[200],
                    //   ),
                    // ),
                    // // SizedBox(height: 160.0),

                    Align(
                      alignment: Alignment(0.0, -0.8),
                      child: Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 52.0,
                            fontFamily: 'SignikaNegative',
                            letterSpacing: 3.0),
                      ),
                    ),

                    Align(
                      alignment: Alignment(0, -0.2),
                      child: Container(
                        width: 320.0,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your Username',
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment(0, 0),
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
                      alignment: Alignment(0, 0.2),
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
                      alignment: Alignment(0.0, 0.4),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SettingsPage()),
                          );
                        },
                        child: Text(
                          'Regsiter',
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
                      alignment: Alignment(0, 0.55),
                      child: Text(
                        '---------- OR ----------',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'SignikaNegative',
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment(0.0, 0.75),
                      child: InkWell(
                        onTap: () async{

                          final newuser = await _googleSignIn.signIn();
                          final googleauth = await newuser!.authentication;
                          final creds = GoogleAuthProvider.credential(
                            accessToken: googleauth.accessToken,
                            idToken: googleauth.idToken
                          );

                          await FirebaseAuth.instance.signInWithCredential(creds);
                        },
                        child: Ink(
                          color: Colors.black,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(60, 18, 60, 18),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/google.png',
                                  height: 20,
                                  width: 20,
                                ), // <-- Use 'Image.asset(...)' here
                                SizedBox(width: 22),
                                Text(
                                  'Sign up with Google',
                                  style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    color: Colors.white,
                                    fontFamily: 'SignikaNegative',
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment(0.0, 0.6),
                    //   child: ElevatedButton(
                    //     onPressed: () {},
                    //     child: Text(
                    //       'Login Using Google',
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //     style: ElevatedButton.styleFrom(
                    //         primary: Colors.black,
                    //         fixedSize: const Size(320, 55),
                    //         side: BorderSide(color: Colors.black),
                    //         //do not give padding buttons wont be of same size
                    //         // padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    //         textStyle: TextStyle(
                    //           fontSize: 22,
                    //           fontFamily: 'SignikaNegative',
                    //           //fontWeight: FontWeight.bold
                    //         )),
                    //   ),
                    // ),

                    Align(
                      alignment: Alignment(0, 0.85),
                      child: Text(
                        'Already Have An Account?',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'SignikaNegative_Light',
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment(0.0, 0.95),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(
                          "Click Here",
                          style: TextStyle(
                              color: Colors.indigo,
                              decoration: TextDecoration.underline,
                              fontSize: 18.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },

      ),
      backgroundColor: Colors.yellow[100],
    );
  }
}
