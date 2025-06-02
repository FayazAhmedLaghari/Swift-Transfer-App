import 'package:flutter/material.dart';
import '../Widgets/custom_button.dart';
import 'LoginScreen.dart';

class RegisterScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Register",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
            SizedBox(height: 8),
            Text("Let's Get Started"),
            SizedBox(height: 24),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: "Full name", border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: "Email", border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                  labelText: "Phone number", border: OutlineInputBorder()),
            ),
            SizedBox(height: 24),
            CustomBlueButton(
              text: 'Register',
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => RegisterScreen()),
                // );
              },
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                  child: Text("Log In",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 26, 125, 206))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
