import 'package:flutter/material.dart';
import 'package:prodution/pages/history.dart';
import 'package:prodution/pages/homepage.dart';

String username = '';

class bottom extends StatefulWidget {
  @override
  State<bottom> createState() => _BottomState();
}

class _BottomState extends State<bottom> {
  int index_color = 0;
  List Screen = [
    homepage(
      username: username,
      isLoggedIn: isLoggedIn,
    ),
    history(),
    // userprofile(
    //   isLoggedIn: isLoggedIn,
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[index_color],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 25,
                  color: index_color == 0 ? Color(0xff0044C9) : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 1;
                  });
                },
                child: Icon(
                  Icons.history,
                  size: 25,
                  color: index_color == 1 ? Color(0xff0044C9) : Colors.grey,
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     setState(() {
              //       index_color = 2;
              //     });
              //   },
              //   child: Icon(
              //     Icons.account_circle_rounded,
              //     size: 30,
              //     color: index_color == 2 ? Color(0xff0044C9) : Colors.grey,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
