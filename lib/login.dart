import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:protekt/firebase_components/firebase_signin.dart';
import 'package:protekt/register.dart';
import 'components/navigation_bar.dart';
import 'on_login_pages/homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser?.uid == null) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: Stack(
              children: <Widget>[
                Align(
                    alignment: Alignment(0.0, -0.6),
                    child: Image.asset(
                      'assets/images/login.gif',
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
                    'Login',
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
                      controller: _emailTextController,
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
                  alignment: Alignment(0, 0.0),
                  child: Container(
                    width: 320.0,
                    child: TextFormField(
                      controller: _passwordTextController,
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
                  alignment: Alignment(0.0, 0.2),
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email:
                                  _emailTextController.text.toString().trim(),
                              password: _passwordTextController.text)
                          .then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BottomBar()),
                        );
                        Fluttertoast.showToast(
                            msg: "Signed-in Successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.black,
                            fontSize: 16.0
                        );
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
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
                  alignment: Alignment(0, 0.4),
                  child: Text(
                    '---------- OR ----------',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'SignikaNegative',
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment(0.0, 0.6),
                  child: InkWell(
                    onTap: () async {
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      final GoogleSignIn googleSignIn = GoogleSignIn();
                      final GoogleSignInAccount? googleSignInAccount =
                          await googleSignIn.signIn();
                      if (googleSignInAccount != null) {
                        final GoogleSignInAuthentication
                            googleSignInAuthentication =
                            await googleSignInAccount.authentication;
                        final AuthCredential authCredential =
                            GoogleAuthProvider.credential(
                                idToken: googleSignInAuthentication.idToken,
                                accessToken:
                                    googleSignInAuthentication.accessToken);

                        // Getting users credential
                        UserCredential result =
                            await auth.signInWithCredential(authCredential);
                        User? user = result.user;

                        if (result != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomBar()),
                          );
                          Fluttertoast.showToast(
                              msg: "Signed-in Successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.black,
                              fontSize: 16.0
                          );
                        } // if result not null we simply call the MaterialpageRoute,
                        // for go to the HomePage screen
                      }
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
                              'Sign in with Google',
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
                  alignment: Alignment(0, 0.75),
                  child: Text(
                    'Do not Have An Account?',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'SignikaNegative_Light',
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment(0.0, 0.85),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
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
        backgroundColor: Colors.yellow[100],
      );
    } else {
      return BottomBar();
    }
  }
}
