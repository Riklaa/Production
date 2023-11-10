import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:prodution/pages/fpassword.dart';
import 'package:prodution/pages/homepage.dart';
import 'package:prodution/widget/bnavbar.dart';

class signin extends StatefulWidget {
  signin({super.key});

  @override
  State<signin> createState() => _Login();
}

class _Login extends State<signin> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  String msg = '';

  Future<void> _login() async {
    if (email.text.isEmpty || password.text.isEmpty) {
      setState(() {
        msg = 'Silahkan isi form yang masih kosong';
      });
      return;
    }

    final response = await http.post(
      Uri.parse("http://192.168.1.12/production/login.php"),
      body: {
        "email": email.text,
        "password": password.text,
      },
    );

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Username / Password Salah";
      });
    } else {
      setState(() {
        isLoggedIn = true;
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => bottom()),
      );
      setState(() {
        username = datauser[0]["username"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _head(),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _head() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 360,
              decoration: BoxDecoration(
                color: Color(0xff092863),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 13,
                    child: isLoggedIn
                        ? Container()
                        : GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => bottom(),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                height: 30,
                                width: 30,
                                child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: isLoggedIn ? 100 : 120,
                      left: 20,
                      right: 80,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: isLoggedIn ? 260 : 270,
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(minHeight: 325),
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                            color: Color(0xff0044C9),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: email,
                          decoration: InputDecoration(
                            hintText: 'Enter Your Email',
                            fillColor: Color(0xFFE7EFFF),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15.0),
                          ),
                          style: TextStyle(fontSize: 12.0),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                            color: Color(0xff0044C9),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter Your Password',
                            fillColor: Color(0xFFE7EFFF),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15.0),
                          ),
                          style: TextStyle(fontSize: 12.0),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return fpassword();
                                },
                              ),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[800]),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          msg,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 223, 12, 12)),
                        ),
                        SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {
                            _login();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff0044C9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 45,
                            alignment: Alignment.center,
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
