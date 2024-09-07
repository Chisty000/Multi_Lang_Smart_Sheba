import 'package:flutter/material.dart';
import 'package:smart_sheba/screens/AssistantScreen.dart';
import 'package:smart_sheba/screens/HomeScreen.dart';
import 'package:smart_sheba/screens/Emergency.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool pressed = false;
  AudioPlayer? _player;
  void _players() {
    pressed = !pressed;

    if (pressed) {
      final player = _player = AudioPlayer();
      player.play(AssetSource('audio.mp3'));
    } else {
      if (_player != null) {
        _player?.stop();
      }
    }

    setState(() {});
  }

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
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightBlue,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: const Text(
                '১ \n প্রাথমিক সহায়তা',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
                height: 20), // Add som/ Add some space between buttons

            // Button to navigate to ChatAssistant
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatAssistant()));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightBlue,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: const Text(
                '২ \n হাসপাতালের তথ্য',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20), // Add some space between buttons

            // Button to navigate to EmergencyContact
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EmergencyContact()));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightBlue,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: const Text(
                '৩ \n জরুরী সেবা',
                textAlign: TextAlign.center,
              ),
            ),
            // Add som
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _players,
        child: !pressed
            ? const Icon(Icons.play_arrow)
            : const Icon(Icons.stop_rounded),
      ),
    );
  }
}
