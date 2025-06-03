import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  Widget transactionTile(
      String title, String name, String amount, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade100),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.amber, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16)),
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Text(amount,
              style: const TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 50,
      ),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Transactions Histroy", // same spelling as image
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Search bar
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFEAF6FF),
                borderRadius: BorderRadius.circular(25),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.amber),
                  hintText: "Search by name, transaction ID",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Transaction List
            Expanded(
              child: ListView(
                children: [
                  transactionTile("Paid to", "Science Museum", "\$198",
                      Icons.arrow_outward),
                  transactionTile("Recived from", "Science Museum", "\$18,000",
                      Icons.arrow_downward),
                  transactionTile("Paid to", "Science Museum", "\$198",
                      Icons.arrow_outward),
                  transactionTile("Recived from", "Science Museum", "\$18,000",
                      Icons.arrow_downward),
                  transactionTile("Paid to", "Science Museum", "\$198",
                      Icons.arrow_outward),
                  transactionTile("Paid to", "Science Museum", "\$198",
                      Icons.arrow_outward),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SendScreen extends StatelessWidget {
  const SendScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("📤 Send Screen", style: TextStyle(fontSize: 24)));
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("👤 Profile Screen", style: TextStyle(fontSize: 24)));
  }
}
