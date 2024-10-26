import 'package:flutter/material.dart';
import 'generate_phrase_screen.dart';
import '../widgets/cta_button.dart'; // Import the CTA button widget

class SignUpScreen extends StatelessWidget {
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
                  // Back Icon
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context); // Go back to the previous screen
                    },
                  ),
                  // Info Icon
                  IconButton(
                    icon: const Icon(Icons.info_outline, color: Colors.white),
                    onPressed: () {
                      // Information icon functionality
                    },
                  ),
                ],
              ),

              // Centered Title and Subtext
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Secure Your Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.07, // Same size as onboarding
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Your secret phrase is your key to your account. Store it safely—if you lose it, you will lose access to your funds.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              // CTAs at the bottom
              Column(
                children: [
                  CtaButton(
                    text: 'Generate Phrase',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GeneratePhraseScreen(),
                        ),
                      );
                    },
                  ),
                  CtaButton(
                    text: 'Skip',
                    isFilled: false,
                    onPressed: () {
                      // Skip functionality
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
