import 'package:flutter/material.dart';
import 'package:sixdot/screens/OTP_verification_screen.dart';
import 'package:sixdot/widgets/cta_button.dart';

class EnterPhoneNumberScreen extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();
  final String selectedCountryCode = '+234'; // Example for Nigeria
  // You might want to replace this with dynamic dropdown selection later

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
                            content: const Text('Enter your phone number for verification.'),
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

              // Centered Title
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter Your Phone Number',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // Row for Country Code Dropdown and Phone Number Input
                  Row(
                    children: [
                      // Dropdown for Country Code
                      DropdownButton<String>(
                        value: selectedCountryCode,
                        items: <String>['+234', '+1', '+44'] // Add other codes as needed
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        dropdownColor: const Color(0xFF03000A),
                        onChanged: (String? newValue) {
                          // Handle the change
                        },
                        iconEnabledColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 10),

                      // Phone Number Input Field
                      Expanded(
                        child: TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.1),
                            hintText: "Phone Number",
                            hintStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // CTAs at the bottom
              Column(
                children: [
                  CtaButton(
                    text: 'Continue',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => OTPVerificationScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
