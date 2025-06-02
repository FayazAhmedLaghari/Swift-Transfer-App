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

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => SendMoneyScreen()),
      // );
    } else if (index != 2) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Send Money")),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex:
              _selectedIndex > 1 ? _selectedIndex - 1 : _selectedIndex,
          onTap: (index) {
            if (index >= 2) index += 1;
            _onItemTapped(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.send_outlined),
              label: 'Send',
            ),
            BottomNavigationBarItem(
              icon: SizedBox.shrink(), // Placeholder for FAB
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.compare_arrows_outlined),
              label: 'Transaction',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 12,
                backgroundImage: AssetImage('assets/user.jpg'),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
