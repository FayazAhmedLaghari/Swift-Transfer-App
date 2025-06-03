import 'package:flutter/material.dart';
import 'package:swifttransferapp/Widgets/custom_button.dart';
import 'Pcrocessing.dart';

class PaymentScreen extends StatelessWidget {
  final double amount = 270.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Payment", style: TextStyle(color: Colors.blue)),
        leading: BackButton(color: Colors.blue),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _paymentDetailRow("Amount to send", "\$$amount"),
            _paymentDetailRow("Recipient", ".............."),
            Divider(height: 30),
            _paymentDetailRow("Total", "\$$amount"),
            SizedBox(height: 20),
            TextField(
                decoration: InputDecoration(labelText: 'Debit Card Number')),
            Row(
              children: [
                Expanded(
                    child: TextField(
                        decoration: InputDecoration(labelText: 'MM/YY'))),
                SizedBox(width: 16),
                Expanded(
                    child: TextField(
                        decoration: InputDecoration(labelText: 'CVV'))),
              ],
            ),
            SizedBox(height: 20),
            CustomBlueButton(
              text: 'Pay Securely',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProcessingScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label), Text(value)],
      ),
    );
  }
}
