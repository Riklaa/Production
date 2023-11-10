import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class qrscan extends StatefulWidget {
  qrscan({Key? key}) : super(key: key);

  @override
  State<qrscan> createState() => _Qr();
}

class _Qr extends State<qrscan> {
  final GlobalKey qrKey = GlobalKey();
  late Barcode result;
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(30),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Scan QR Code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff092863),
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        _startScan();
                      },
                      child: Icon(
                        Icons.camera_alt,
                        size: 30.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Masukkan QR Code Disini',
                        hintStyle: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  // function setelah memasukan kode qr
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 0, 34, 205),
                  onPrimary: Colors.white,
                ),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _startScan() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                    Text(
                      'Scan QR Code',
                      style: TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 0, 34, 205),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(width: 15.0),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: QRView(
                          key: qrKey,
                          onQRViewCreated: _onQRViewCreated,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Arahkan kamera anda ke QR Code untuk memulai pemindaian.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        // hasil setelah berhasil scan qr
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
