import 'package:flutter/material.dart';
import '../widgets/cta_button.dart';
import 'backup_confirmed_screen.dart';

class ConfirmPhraseScreen extends StatelessWidget {
  final List<String> generatedPhrases; // Accepting the generated phrases from the previous screen

  const ConfirmPhraseScreen({super.key, required this.generatedPhrases});

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
                      // Info icon functionality (optional)
                    },
                  ),
                ],
              ),

              // Title and subtext
              Column(
                children: [
                  Text(
                    'Confirm Your Secret Phrase',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Select the correct words from the phrases shown below.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Select Word "any digit"',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              // Stroked frame for selecting words
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 words per row
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: generatedPhrases.length,
                  shrinkWrap: true, // Allows the GridView to take the height of the children
                  physics: const NeverScrollableScrollPhysics(), // Prevents scrolling
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Logic to handle word selection
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          generatedPhrases[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // CTA Buttons
              Column(
                children: [
                  CtaButton(
                    text: 'Verify Phrase',
                    onPressed: () {
                      // Implement logic to verify the phrase first
                      // If verification is successful:
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => BackupConfirmedScreen()), // Navigate to Backup confirmed screen
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
