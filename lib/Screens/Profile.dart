import 'package:flutter/material.dart';
import 'package:swifttransferapp/Screens/AccountDetails.dart';
import 'package:swifttransferapp/Screens/EditPic.dart';
import 'package:swifttransferapp/Screens/Editprofile.dart';

class ProfileScreenSimple extends StatelessWidget {
  const ProfileScreenSimple({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 10),
          Center(
            child: Stack(
              children: [
                GestureDetector(
                  onTap: (){
                     Navigator.push(context,
                        MaterialPageRoute(builder: (_) => EditPic()));
                  },
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/user.jpg"), // <-- your uploaded image
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                   child:  IconButton(
            icon: Icon(Icons.edit, color: Colors.orange), // Assuming it's a settings icon as per the image
            onPressed: () {
              // Handle settings icon press
                Navigator.push(context,
                        MaterialPageRoute(builder: (_) => EditProfileScreen()));
            },
          ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Mato Doe",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue,
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Profile",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: const Icon(Icons.person_outline, size: 28),
            title: const Text("Account details"),
            onTap: () {
               Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PersonalInfoScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.history, size: 28),
            title: const Text("Transaction history"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
