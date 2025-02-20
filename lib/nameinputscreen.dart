import 'package:flutter/material.dart';
import 'username_screen.dart'; // Import the next screen

class NameInputScreen extends StatefulWidget {
  const NameInputScreen({super.key});

  @override
  _NameInputScreenState createState() => _NameInputScreenState();
}

class _NameInputScreenState extends State<NameInputScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/bg_image.jpg', // Background image
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),

                // Title
                const Center(
                  child: Text(
                    "WHAT'S YOUR NAME?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // First Name Field
                const Text(
                  "FIRST NAME",
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
                TextField(
                  controller: firstNameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Last Name Field
                const Text(
                  "LAST NAME",
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
                TextField(
                  controller: lastNameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Privacy Disclaimer
                const Text(
                  "BY TAPPING SIGN UP & ACCEPT, YOU ACKNOWLEDGE THAT YOU HAVE READ THE PRIVACY POLICY AND AGREE TO THE TERMS OF SERVICE.",
                  style: TextStyle(fontSize: 12, color: Colors.white60),
                  textAlign: TextAlign.center,
                ),

                const Spacer(),

                // Sign Up Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      String fullName =
                          "${firstNameController.text} ${lastNameController.text}";
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => UsernameScreen(username: fullName),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "SIGN UP & ACCEPT",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
