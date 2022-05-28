import 'package:flutter/material.dart';
import 'package:protekt/components/navigation_bar.dart';
import 'package:protekt/on_login_pages/settings.dart';
import '../components/fab.dart';
class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(

        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          )
        ],
      ),

      body: Center(
        child: SafeArea(
          child: Nav()

        ),
      ),

    );
  }
}
