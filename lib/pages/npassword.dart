import 'package:flutter/material.dart';
import 'package:prodution/widget/success.dart';

class npassword extends StatefulWidget {
  npassword({super.key});

  @override
  State<npassword> createState() => _NpasswordState();
}

class _NpasswordState extends State<npassword> {
  TextEditingController npassword1 = TextEditingController();
  TextEditingController npassword2 = TextEditingController();

  String msg = '';

  Future<void> _npassword() async {
    if (npassword1.text.isEmpty || npassword2.text.isEmpty) {
      setState(() {
        msg = 'Silahkan isi form yang masih kosong';
      });
      return;
    }
    if (npassword1.text != npassword2.text) {
      setState(() {
        msg = 'Password tidak sama';
      });
      return;
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return success();
      },
    );
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
                          'Create New Password',
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
          padding: const EdgeInsets.only(top: 280, left: 20, right: 20),
          child: Container(
            height: 295,
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
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Password',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: Color(0xff0044C9),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: npassword1,
                        decoration: InputDecoration(
                          hintText: 'Enter New Password',
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
                        'Confirm New Password',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: Color(0xff0044C9),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: npassword2,
                        decoration: InputDecoration(
                          hintText: 'Confirm Your New Password',
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
                          _npassword();
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
