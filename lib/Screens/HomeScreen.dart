import 'package:flutter/material.dart';
import 'package:swifttransferapp/Screens/Profile.dart';
import 'package:swifttransferapp/Screens/TrnsitionHistory.dart';
import 'send_money.dart';
import 'Receive.dart';
import 'TraasferSuccees.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    MainHomeView(),
     SendMoneyScreen(),
    const TransactionScreen(),
    const ProfileScreenSimple(),
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
                  backgroundImage: AssetImage('assets/user.jpg'),
                )
              : Icon(icon,
                  color: isSelected ? Colors.lightBlue : Colors.grey),
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
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TransferSuccessScreen()),
          );
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.qr_code_scanner, size: 28, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
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

class MainHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double balance = 987.76;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0).copyWith(
            bottom: MediaQuery.of(context).viewInsets.bottom + 80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      "\$$balance",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text("Available Balance"),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SendMoneyScreen()),
                            );
                          },
                          icon: Icon(Icons.arrow_upward),
                          label: Text("Send"),
                        ),
                        SizedBox(width: 16),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_downward),
                          label: Text("Receive"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    "Quick Send",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_circle_outline),
                  ),
                ],
              ),
              SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('assets/user.jpg'),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "User \${index + 1}",
                          style: TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  transactionTile("Imaan Fatima", "20/05/2025", "\$198"),
                  transactionTile("Haya Noor", "18/05/2025", "\$99"),
                  transactionTile("Wareesha", "29/04/2025", "\$309"),
                  transactionTile("M Ibrahim", "05/05/2025", "\$270"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget transactionTile(String name, String date, String amount) {
    return ListTile(
      leading: Icon(Icons.verified, color: Colors.amber),
      title: Text(name),
      subtitle: Text(date),
      trailing: Text(amount),
    );
  }
}

class SendScreen extends StatelessWidget {
  const SendScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("\uD83D\uDCE4 Send Screen", style: TextStyle(fontSize: 24)));
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
        child:
            Text("\uD83D\uDC64 Profile Screen", style: TextStyle(fontSize: 24)));
  }
}

