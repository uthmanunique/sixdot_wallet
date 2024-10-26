import 'package:flutter/material.dart';
import '../widgets/cta_button.dart';
import 'setup_pin_screen.dart'; // Import your SetupPinScreen

class BackupConfirmedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF03000A),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Header with Back and Info Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context); // Go back
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.info_outline, color: Colors.white),
                    onPressed: () {
                      // Info dialog or functionality
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Information'),
                            content: const Text('Your backup has been successfully confirmed.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),

              // Title and Subtext at the Center
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Backup Confirmed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Your backup has been successfully confirmed. You can now set up your PIN for added security.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                      textAlign: TextAlign.center,
                    ),
                ],
              ),

              // CTA Buttons
              Column(
                children: [
                  CtaButton(
                    text: 'Next',
                    onPressed: () {
                      // Navigate to set up pin screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SetupPinScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CtaButton(
                    text: 'Cancel',
                    isFilled: false,
                    onPressed: () {
                      // Logic to cancel and go back
                      Navigator.pop(context); // Go back to the previous screen
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
