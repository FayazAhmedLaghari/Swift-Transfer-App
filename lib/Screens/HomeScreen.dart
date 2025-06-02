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
      appBar: AppBar(title: Text("Home")),
      resizeToAvoidBottomInset: false, // Prevents automatic resizing
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
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
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text("Quick Send",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add_circle_outline),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
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
                        ListTile(
                          title: Text("Imaan Fatima"),
                          subtitle: Text("20/05/2025"),
                          trailing: Text("\$198"),
                        ),
                        ListTile(
                          title: Text("Haya Noor"),
                          subtitle: Text("18/05/2025"),
                          trailing: Text("\$99"),
                        ),
                        ListTile(
                          title: Text("Wareesha"),
                          subtitle: Text("29/04/2025"),
                          trailing: Text("\$309"),
                        ),
                        ListTile(
                          title: Text("M Ibrahim"),
                          subtitle: Text("05/05/2025"),
                          trailing: Text("\$270"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
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
              icon: SizedBox.shrink(), // Empty space for FAB
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
}
