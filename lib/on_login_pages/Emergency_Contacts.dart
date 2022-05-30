import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';

class Emergency_Contact extends StatefulWidget {
  @override
  _Emergency_ContactState createState() => _Emergency_ContactState();
}

class _Emergency_ContactState extends State<Emergency_Contact> {
  final FlutterContactPicker _contactPicker = new FlutterContactPicker();
  Contact? _contact;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                        alignment: Alignment(1, 0),
                        child: IconButton(
                          iconSize: 30,
                          icon: Icon(
                            Icons.settings,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        )),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Emergency Contacts',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'SignikaNegative',
                          letterSpacing: 3.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  _contact == null
                      ? 'No contact selected.'
                      : _contact.toString(),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.vertical(
              top: Radius.elliptical(100, 100),
              bottom: Radius.circular(100),
            ),
          ),
          onPressed: () async {
            Contact? contact = await _contactPicker.selectContact();
            setState(() {
              _contact = contact;
            });
          },
        ),
      ),
    );
  }
}
