import 'package:flutter/material.dart';
import 'Receive.dart';
import 'TraasferSuccees.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 2;

  // Screens List
  final List<Widget> _screens = [
    ReceiveScreen(),
    const SendScreen(),
    const TransactionScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget navItem(IconData icon, String label, int index,
      {bool isProfile = false}) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isProfile
              ? const CircleAvatar(
                  radius: 12,
                  backgroundImage:
                      AssetImage('assets/user.jpg') // if image in assets

                  )
              : Icon(icon, color: isSelected ? Colors.lightBlue : Colors.grey),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isSelected ? Colors.lightBlue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TransferSuccessScreen()),
          );
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(
          Icons.qr_code_scanner,
          size: 28,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navItem(Icons.home, 'Home', 0),
              navItem(Icons.send, 'Send', 1),
              const SizedBox(width: 48),
              navItem(Icons.swap_horiz, 'Transaction', 2),
              navItem(Icons.person, 'Profile', 3, isProfile: true),
            ],
          ),
        ),
      ),
    );
  }
}

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
