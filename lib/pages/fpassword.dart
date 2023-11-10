import 'package:flutter/material.dart';
import 'package:prodution/pages/otp.dart';

class fpassword extends StatefulWidget {
  fpassword({super.key});

  @override
  State<fpassword> createState() => _FpasswordState();
}

class _FpasswordState extends State<fpassword> {
  TextEditingController email = new TextEditingController();

  String msg = '';

  Future<void> _fpassword() async {
    if (email.text.isEmpty) {
      setState(() {
        msg = 'Silahkan isi form yang masih kosong';
      });
      return;
    } else if (!email.text.contains('@gmail.com') &&
        !email.text.contains('@yahoo.com')) {
      setState(() {
        msg = 'Silahkan isi menggunakan email yang valid';
      });
    } else {
      setState(() {
        msg = '';
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => otp()),
      );
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
              height: 380,
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
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
                    padding:
                        const EdgeInsets.only(top: 140, left: 20, right: 55),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recover Account',
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
          padding: const EdgeInsets.only(top: 300, left: 20, right: 20),
          child: Container(
            height: 260,
            width: 370,
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
                SizedBox(height: 30),
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
                      Text(
                        'Silahkan input email yang terdaftar untuk merubah password anda',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 15),
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
                      SizedBox(
                        height: 5,
                      ),
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
                          _fpassword();
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
                            'Submit',
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
      ],
    );
  }
}
