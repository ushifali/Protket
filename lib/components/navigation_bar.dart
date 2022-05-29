import 'package:flutter/material.dart';

import '../on_login_pages/Audio_Record.dart';
import '../on_login_pages/fake_call.dart';
import '../on_login_pages/homepage.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _page);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          onTap: (index) {
            this._pageController.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.easeIn);
          },
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            new BottomNavigationBarItem(
                icon: Icon(Icons.record_voice_over), label: "Audio Record"),
            new BottomNavigationBarItem(
                icon: Icon(Icons.message), label: "Messages"),
          ]),
      body: PageView(
        controller: _pageController,
        onPageChanged: (newpage) {
          setState(() {
            this._page = newpage;
          });
        },
        children: [
          Homepage(),
          Audio_Record(),
          singlechild(title: "Call", icon: Icons.call, color: Colors.blue)
        ],
      ),
    );
  }

  singlechild({String? title, IconData? icon, Color? color}) {
    return Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 60,
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
