import 'package:flutter/material.dart';
import 'package:swifttransferapp/Screens/HomeScreen.dart';

class ReceiveScreen extends StatelessWidget {
  final List<Map<String, String>> transactions = [
    {'name': 'Imaan Fatima', 'date': '20/05/2025', 'amount': '\$198'},
    {'name': 'Haya Noor', 'date': '18/05/2025', 'amount': '\$99'},
    {'name': 'Wareesha', 'date': '29/04/2025', 'amount': '\$309'},
    {'name': 'M Ibrahim', 'date': '05/05/2025', 'amount': '\$270'},
    {'name': 'M Ibrahim', 'date': '05/05/2025', 'amount': '\$270'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back button
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.lightBlue),
                onPressed: () {
                     Navigator.push(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                },
              ),
            ),

            // Title: "Receive"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '\t\tReceive',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                ),
              ),
            ),

            const SizedBox(height: 8),

            // List of transactions
            Expanded(
              child: ListView.separated(
                itemCount: transactions.length,
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color: Colors.grey.shade200,
                ),
                itemBuilder: (context, index) {
                  final item = transactions[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.check_circle, color: Colors.yellow),
                    ),
                    title: Text(
                      item['name']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(item['date']!),
                    trailing: Text(
                      item['amount']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
