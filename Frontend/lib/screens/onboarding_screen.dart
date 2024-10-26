import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'signin_screen.dart';
import '../widgets/cta_button.dart';
import '../widgets/progress_bar.dart';

class OnboardingScreen extends StatelessWidget {
  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Welcome to SixDot',
      'description': 'Your description here.',
      'image': 'assets/onboarding1.png',
    },
    {
      'title': 'Manage Your Finances',
      'description': 'Your description here.',
      'image': 'assets/onboarding2.png',
    },
    {
      'title': 'Experience the Future',
      'description': 'Your description here.',
      'image': 'assets/onboarding3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF03000A),
      body: PageView.builder(
        itemCount: onboardingData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ), // Responsive padding
            child: Column(
              children: [
                const SizedBox(height: 50), // Adds top space
                ProgressBar(
                  currentIndex: index,
                  total: onboardingData.length,
                  width: 224,
                  height: 8,
                ),
                const SizedBox(height: 40), // Space between progress and image
                Image.asset(
                  onboardingData[index]['image']!,
                  width: 250, // Fixed width
                  height: 350, // Fixed height
                ),
                const Spacer(), // Moves text down
                Text(
                  onboardingData[index]['title']!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.06, // Responsive font size
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  onboardingData[index]['description']!,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                if (index == onboardingData.length - 1) ...[
                  CtaButton(
                    text: 'Sign Up',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                  ),
                  CtaButton(
                    text: 'Sign In',
                    isFilled: false,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                  ),
                ] else ...[
                  CtaButton(
                    text: 'Next',
                    onPressed: () {
                      // Logic to navigate to the next screen
                    },
                  ),
                  CtaButton(
                    text: 'Skip',
                    isFilled: false,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                  ),
                ],
                const SizedBox(height: 30), // Bottom padding for CTA buttons
              ],
            ),
          );
        },
      ),
    );
  }
}
