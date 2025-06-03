import 'package:flutter/material.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({super.key});

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
  icon: Icon(Icons.close), // ❌ Cut icon
  onPressed: () {
    Navigator.pop(context); // Goes back to previous screen
  },
),
        backgroundColor: Colors.white,
        title: Text(
          "Scan QR Code",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlue),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.qr_code_2, size: 80, color: Colors.black87),
        ),
      ),
    );
  }
}
