import 'package:flutter/material.dart';
import 'package:protekt/components/navigation_bar.dart';
import '../components/fab.dart';
class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
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
