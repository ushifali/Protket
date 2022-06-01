import 'package:flutter/material.dart';
import 'package:protekt/on_login_pages/settings.dart';

import 'package:fluttercontactpicker/fluttercontactpicker.dart';

PhoneContact? _phoneContact;

class Emergency_Contact extends StatefulWidget {
  @override
  _Emergency_ContactState createState() => _Emergency_ContactState();
}

class _Emergency_ContactState extends State<Emergency_Contact> {
  List<DynamicWidget> listDynamic = [];
  List<String> data = [];

  Icon floatingIcon = new Icon(Icons.add);

  addDynamic() {
    if (data.length != 0) {

      data = [];
      listDynamic = [];

    }

    setState(() {});
    if (listDynamic.length >= 10) {
      return;
    }
    listDynamic.add(new DynamicWidget());
  }



  @override
  Widget build(BuildContext context) {
    Widget result = new Flexible(
        flex: 1,
        child: new Card(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              return new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      margin: new EdgeInsets.only(left: 10.0),
                      child: new Text("${index + 1} : ${data[index]}"),
                    ),
                    new Divider()
                  ],
                ),
              );
            },
          ),
        ));

    Widget dynamicTextField = new Flexible(
      flex: 2,
      child: new ListView.builder(
        itemCount: listDynamic.length,
        itemBuilder: (_, index) => listDynamic[index],
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Emergency Contacts',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'SignikaNegative',
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        iconSize: 30,
                        icon: Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsPage()),
                          );
                        },
                      )),
                ],
              ),

              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'You can enter a max of 10 contacts',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'SignikaNegative',

                  ),
                ),
              ),
              data.length == 0 ? dynamicTextField : result,
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
          List<DynamicWidget> listDynamic = [];
          final PhoneContact contact =
              await FlutterContactPicker.pickPhoneContact();

          print(contact);
          setState(() {
            _phoneContact = contact;
          });
          addDynamic();
        },
      ),
    );
  }
}

class DynamicWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18.0),
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.amber[200],
          border: Border.all(color: Colors.black)),
      child: Column(
        children: [
          Text(
            "Name: ${_phoneContact!.fullName}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'SignikaNegative',
              letterSpacing: 1.0,
            ),
          ),
          Text(
            "Phone: ${_phoneContact!.phoneNumber!.number}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'SignikaNegative',
            ),
          )
        ],
      ),
    );
  }
}
