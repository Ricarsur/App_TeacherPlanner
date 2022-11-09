import 'package:acadocen/UI/pages/pages.dart';
import 'package:flutter/material.dart';

class Qr_student extends StatelessWidget {
  const Qr_student({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Tu código QR',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 20),
            QrImage(
              data: 'https://google.com',
              version: QrVersions.auto,
              size: 200.0,
              foregroundColor: Color.fromARGB(255, 6, 69, 121),
              gapless: true,
              errorCorrectionLevel: QrErrorCorrectLevel.Q,
            ),
          ],
        ),
      ),
    );
  }
}