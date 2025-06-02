import 'package:flutter/material.dart';
import '../Widgets/custom_button.dart';
import 'LoginScreen.dart';
import 'RegisterScreen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              "SwiftTransfer",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            SizedBox(height: 12),
            Text(
              "Fast, Secure, and Affordable Money Transfers.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 32),
            CustomBlueButton(
              text: 'Get Started',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
            ),
            SizedBox(height: 12),
            OutlinedButton(
              onPressed: () {},
              child: Text("Learn More"),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // square edges
                ),
              ),
            ),
            Spacer(),
            Text(
              "FCA Regulated | Secure Transactions | Powered by Trust",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
