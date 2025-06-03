import 'package:flutter/material.dart';
import 'dart:async';
import 'TrnsitionHistory.dart';

class ProcessingScreen2 extends StatefulWidget {
  const ProcessingScreen2({super.key});

  @override
  State<ProcessingScreen2> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen2> {
  @override
  void initState() {
    super.initState();

    // Navigate to next screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 50,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: Colors.amber,
              strokeWidth: 4,
            ),
            const SizedBox(height: 20),
            const Text(
              "Processing your\ntransfer securely...",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
