import 'package:flutter/material.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/bg_image.jpg', // Ensure this image is in assets folder
            fit: BoxFit.cover,
          ),

          // App Bar Title
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 8),
              child: Text(
                "Camera",
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
            ),
          ),

          // Camera Button in Center
          Center(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.6), // Dark background
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.camera_alt,
                  size: 50,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Handle camera button press
                },
              ),
            ),
          ),

          // Bottom Navigation Bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.play_arrow,
                      size: 30,
                      color: Colors.white70,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.camera,
                      size: 30,
                      color: Colors.yellow,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.people_alt,
                      size: 30,
                      color: Colors.white70,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
