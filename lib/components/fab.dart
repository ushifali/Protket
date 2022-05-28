import 'package:flutter/material.dart';


class float extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          height:100,
          width:100,
          child:FloatingActionButton(
            child: Icon(Icons.add), //child widget inside this button
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.zero
            ),
            onPressed: (){
              print("Button is pressed.");
              //task to execute when this button is pressed
            },
          ),
        ),
        backgroundColor: Colors.yellow[800], //background color of scaffold
        appBar: AppBar(
          title:Text("Floating Action Button"), //title of app
          backgroundColor: Colors.yellow[800], //background color of app bar
        ),

        body: Center(
            child:Text("Floating Action Button")
        )
    );
  }
}