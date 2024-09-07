import 'package:flutter/material.dart';
import 'package:smart_sheba/screens/AssistantScreen.dart';
import 'package:smart_sheba/screens/HomeScreen.dart';
import 'package:smart_sheba/screens/Emergency.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Off-white background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Cross Icon as Logo
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Icon(
                Icons
                    .add_circle_outline, // You can replace this with a healthcare-related icon
                size: 100,
                color: Colors.redAccent, // Customize the color as needed
              ),
            ),

            // Button to navigate to ChatPage
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatPage()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue,
                onPrimary: Colors.white,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              icon: Icon(Icons.chat, size: 30),
              label: Text('Primary Care'),
            ),
            SizedBox(height: 20), // Add some space between buttons

            // Button to navigate to ChatAssistant
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatAssistant()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue,
                onPrimary: Colors.white,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              icon: Icon(Icons.assistant, size: 30),
              label: Text('Smart Desk'),
            ),
            SizedBox(height: 20), // Add some space between buttons

            // Button to navigate to EmergencyContact
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EmergencyContact()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              icon: Icon(Icons.local_hospital, size: 30),
              label: Text('Emergency Contact'),
            ),
          ],
        ),
      ),
    );
  }
}
