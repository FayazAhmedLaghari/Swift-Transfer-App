import 'package:flutter/material.dart';
import 'package:swifttransferapp/Screens/payment_screen.dart';

import '../Widgets/custom_button.dart';

class SendMoneyScreen extends StatefulWidget {
  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController senderAmountController = TextEditingController();

  final TextEditingController receiverAmountController =
      TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Send Money", style: TextStyle(color: Colors.blue)),
        leading: BackButton(color: Colors.blue),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Enter Email')),
            TextField(
                controller: senderAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Sender Amount')),
            TextField(
                controller: receiverAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Receiver Amount')),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                prefix: Text('+92 | '),
              ),
            ),
            SizedBox(height: 20),
            CustomBlueButton(
              text: ' Confirm ',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()),
                );
              },
            ),
          ],
        ),
      ),
        );
  }
}
