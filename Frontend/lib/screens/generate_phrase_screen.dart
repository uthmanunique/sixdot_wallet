import 'package:flutter/material.dart';
import '../widgets/cta_button.dart';
import 'confirm_phrase_screen.dart';

class GeneratePhraseScreen extends StatelessWidget {
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
              // Header with back and info icons
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
                      // Info icon functionality
                    },
                  ),
                ],
              ),

              // Title and subtext
              Column(
                children: [
                  Text(
                    'Your Secret Phrase',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.07, // Keep size consistent
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Write down or copy these words in the correct order. This is your backup. Keep it safe and offline.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              // Secret phrase box
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('1. Apple', style: TextStyle(color: Color(0xFF7C4DFF))),
                        Text('13. Able', style: TextStyle(color: Color(0xFF7C4DFF))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2. Table', style: TextStyle(color: Color(0xFF7C4DFF))),
                        Text('14. Chair', style: TextStyle(color: Color(0xFF7C4DFF))),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2. Table', style: TextStyle(color: Color(0xFF7C4DFF))),
                        Text('14. Chair', style: TextStyle(color: Color(0xFF7C4DFF))),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2. Table', style: TextStyle(color: Color(0xFF7C4DFF))),
                        Text('14. Chair', style: TextStyle(color: Color(0xFF7C4DFF))),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2. Table', style: TextStyle(color: Color(0xFF7C4DFF))),
                        Text('14. Chair', style: TextStyle(color: Color(0xFF7C4DFF))),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2. Table', style: TextStyle(color: Color(0xFF7C4DFF))),
                        Text('14. Chair', style: TextStyle(color: Color(0xFF7C4DFF))),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2. Table', style: TextStyle(color: Color(0xFF7C4DFF))),
                        Text('14. Chair', style: TextStyle(color: Color(0xFF7C4DFF))),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2. Table', style: TextStyle(color: Color(0xFF7C4DFF))),
                        Text('14. Chair', style: TextStyle(color: Color(0xFF7C4DFF))),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2. Table', style: TextStyle(color: Color(0xFF7C4DFF))),
                        Text('14. Chair', style: TextStyle(color: Color(0xFF7C4DFF))),
                      ],
                    ),

                  ],
                ),
              ),

              // CTA Buttons
              Column(
                children: [
                  CtaButton(
                    text: 'Copy Phrase',
                    onPressed: () {
                      // Copy Phrase functionality
                    },
                  ),
                  CtaButton(
                    text: 'Next',
                    isFilled: false,
                    onPressed: () {
                      // Navigate to Confirm Phrase Screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ConfirmPhraseScreen(generatedPhrases: [],)),
                      );
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
