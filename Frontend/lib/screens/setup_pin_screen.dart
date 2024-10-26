import 'package:flutter/material.dart';
import 'setup_username_screen.dart';
import 'signin_screen.dart'; // Import the Sign In screen for navigation
import '../widgets/cta_button.dart'; // Import the CTA button widget

class SetupPinScreen extends StatelessWidget {
  final List<TextEditingController> pinControllers = List.generate(4, (index) => TextEditingController());

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
                      // Show info dialog or navigate to info screen
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Information'),
                            content: const Text('Set your 4-digit PIN for recurring sign-in.'),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),

              // Centered Title and Subtext
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Setup Your PIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // PIN input fields with spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0), // Adjust spacing here
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: TextField(
                            controller: pinControllers[index],
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.1),
                              hintText: '0',
                              hintStyle: const TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            obscureText: true,
                            style: const TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1, // Restrict to 1 character
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),

              // CTAs at the bottom
              Column(
                children: [
                  CtaButton(
                    text: 'Continue',
                    onPressed: () {
                      // Optionally gather the PIN from the controllers
                      String pin = pinControllers.map((controller) => controller.text).join();

                      // Here you can add logic to save the PIN
                      // For now, navigate to the Home Screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SetupUsernameScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      // Navigate back to the SignIn Screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                    child: const Text(
                      "Already have an account? Sign In",
                      style: TextStyle(color: Colors.white),
                    ),
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
