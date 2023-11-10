import 'package:flutter/material.dart';
import 'package:prodution/pages/signin.dart';

class success extends StatefulWidget {
  success({super.key});

  @override
  State<success> createState() => _Success();
}

class _Success extends State<success> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        height: 310.0,
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 15.0),
            Text(
              'Password Changed !',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Your password has been changed sucessfully',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 60),
                  child: Icon(
                    Icons.check_circle,
                    size: 120.0,
                    color: Color(0xff0044C9),
                  ),
                ),
                SizedBox(width: 10.0),
              ],
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => signin(),
                ));
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xff0044C9),
                onPrimary: Colors.white,
              ),
              child: Container(
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
