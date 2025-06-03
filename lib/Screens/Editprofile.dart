import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String _gender = 'Female'; // Initial gender value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text('Edit Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings,
                color: Colors.orange), // Assuming it's a settings icon as per the image
            onPressed: () {
              // Handle settings icon press
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/user.jpg'), // Replace with your image path
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.orange, width: 2),
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.orange,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Mato Doe',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 30),
          _buildProfileTile(context, 'Name', 'Mato Doe'),
          _buildProfileTile(context, 'User name', 'Mato Doe'),
          // Modified to allow changing gender
          _buildProfileTile(context, 'Gender', _gender, showArrow: true, onTap: _changeGender),
          // You can add more profile fields here
        ],
      ),
    );
  }

  Widget _buildProfileTile(BuildContext context, String title, String value,
      {bool showArrow = false, VoidCallback? onTap}) {
    return Column(
      children: [
        InkWell(
          // Use InkWell to make the tile tappable
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (showArrow)
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.orange,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Divider(height: 1, indent: 16, endIndent: 16), // Divider below each tile
      ],
    );
  }

  // Function to change gender
  void _changeGender() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.male),
                  title: Text('Male'),
                  onTap: () {
                    setState(() {
                      _gender = 'Male';
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.female),
                  title: Text('Female'),
                  onTap: () {
                    setState(() {
                      _gender = 'Female';
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Other'),
                  onTap: () {
                    setState(() {
                      _gender = 'Other';
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}