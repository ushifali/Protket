import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'openscreen.dart';


Future<void> main()  async {
  //app gets initialized in firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: OpenScreen(),
    );
  }
}

