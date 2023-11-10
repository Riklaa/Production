import 'package:flutter/material.dart';
import 'package:prodution/pages/npassword.dart';

class otp extends StatefulWidget {
  otp({super.key});

  @override
  State<otp> createState() => _OtpState();
}

class _OtpState extends State<otp> {
  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();
  TextEditingController otpController5 = TextEditingController();

  String msg = '';

  Future<void> _otp() async {
    if (otpController1.text.isEmpty ||
        otpController2.text.isEmpty ||
        otpController3.text.isEmpty ||
        otpController4.text.isEmpty ||
        otpController5.text.isEmpty) {
      setState(() {
        msg = 'Silahkan isi form yang masih kosong';
      });
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => npassword()),
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

  Widget buildOTPTextField(TextEditingController controller) {
    return Container(
      width: 50,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          counterText: '',
          fillColor: Color(0xFFE7EFFF),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide.none,
          ),
        ),
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
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
                          'Masukkan Kode OTP',
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
            height: 265,
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
                        'Kode OTP',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: Color(0xff0044C9),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Silahkan masukan kode otp yang telah dikirimkan ke email anda',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildOTPTextField(otpController1),
                          buildOTPTextField(otpController2),
                          buildOTPTextField(otpController3),
                          buildOTPTextField(otpController4),
                          buildOTPTextField(otpController5),
                        ],
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
                          _otp();
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
