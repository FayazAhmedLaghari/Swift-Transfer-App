import 'package:flutter/material.dart';
import 'send_money.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SendMoneyScreen()),
      );
    } else if (index != 2) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double balance = 987.76;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: TextStyle(color: Colors.blue)),
        leading: BackButton(color: Colors.blue),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true, // allow for keyboard-safe resizing
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
                          "User ${index + 1}",
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onItemTapped(2);
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.qr_code_scanner, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        padding: EdgeInsets.only(bottom: 10),
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
              icon: SizedBox.shrink(), // space for FAB
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.compare_arrows_outlined),
              label: 'Transactions',
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

  Widget transactionTile(String name, String date, String amount) {
    return ListTile(
      leading: Icon(Icons.verified, color: Colors.amber),
      title: Text(name),
      subtitle: Text(date),
      trailing: Text(amount),
    );
  }
}
