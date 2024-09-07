// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContact extends StatelessWidget {
  // Replace these with the actual contact details
  final String officeDeskNumber = '02-41060801-19';
  final String otherNumber = '02-41060801-19';
  final String emailAddress = 'appointmentchl@gmail.com';

  // Function to launch phone call
  void _callNumber(String number) async {
    final url = 'tel:$number';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function to launch email app
  void _sendEmail(String email) async {
    final url = 'mailto:$email';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contact'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => _callNumber(officeDeskNumber),
              icon: Icon(Icons.phone, size: 30),
              label: Text('Call Office Desk'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => _sendEmail(emailAddress),
              icon: Icon(Icons.email, size: 30),
              label: Text('Send Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => _callNumber(
                  otherNumber), // Replace 'AmbulanceNumber' with the actual ambulance number
              icon: Icon(Icons.local_hospital, size: 30),
              label: Text('Call Ambulance'),
            ),
          ],
        ),
      ),
    );
  }
}
