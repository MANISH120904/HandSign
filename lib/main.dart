import 'package:flutter/material.dart';
import 'nameinputscreen.dart';

class RecognitionScreen extends StatelessWidget {
  final String imagePath;

  const RecognitionScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recognition Result")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display Captured Image
            Image.asset(imagePath, height: 300, width: 300, fit: BoxFit.cover),

            const SizedBox(height: 20),

            // Recognition Result (Placeholder for ML Integration)
            const Text(
              "Recognized Sign: Loading...",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to Camera
              },
              child: const Text("Capture Again"),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/background.jpg', // Ensure the image is in assets folder
            fit: BoxFit.cover,
          ),

          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100), // Increased from 50 to 100
              // Title Text
              const Text(
                "BREAKING BARRIERS WITH AI",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 7),
              const Text(
                "TRANSLATE SIGNS INSTANTLY",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 250, 248, 248),
                ),
                textAlign: TextAlign.center,
              ),

              const Spacer(), // Keeps other content below
              // Welcome Text
              const Text(
                "WELCOME TO HANDSIGN",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 20),

              // Start Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NameInputScreen(),
                    ),
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "START",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ],
      ),
    );
  }
}
