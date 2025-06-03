import 'package:flutter/material.dart';

class EditPic extends StatefulWidget {
  const EditPic({super.key});

  @override
  State<EditPic> createState() => _EditPicState();
}

class _EditPicState extends State<EditPic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.3,
        ),
        Center(
          child: CircleAvatar(
            radius: 100,
                    backgroundImage: AssetImage("assets/user.jpg"), 
          ),
        ),
        SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(15.0),
          child: OutlinedButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              "Profile Photo",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          content: const Text(
            "Your profile photo will be used in your profile, chats, products, and channels. You can change your photo up every 14 days.",
          ),
          actionsPadding: const EdgeInsets.symmetric(vertical: 16),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade300,
                foregroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text("Cancel"),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                // Show Bottom Sheet
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (_) => Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Center(child: const Text("Take Photo")),
                          onTap: () {
                            Navigator.pop(context);
                            // Camera logic
                          },
                        ),
                        const Divider(color: Colors.blue,),
                        ListTile(
                          title: Center(child: const Text("Select from Album")),
                          onTap: () {
                            Navigator.pop(context);
                            // Gallery logic
                          },
                        ),
                        const Divider(color: Colors.blue,),
                        ListTile(
                          title: Center(child: const Text("Cancel")),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  },
  child: const Text(
    "Edit Profile Photo",
    style: TextStyle(color: Colors.white),
  ),
  style: OutlinedButton.styleFrom(
    minimumSize: const Size(double.infinity, 50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
  ),
),

          ),
      ],),
    );
  }
}