import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:protekt/components/navigation_bar.dart';
import 'openscreen.dart';


Future<void> main()  async {
  //app gets initialized in firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(FirebaseAuth.instance.currentUser?.uid == null){
// not logged
      return MaterialApp(
        debugShowCheckedModeBanner:false,
        home: OpenScreen(),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner:false,
        home: BottomBar(),
      );
// logged
    }

  }
}