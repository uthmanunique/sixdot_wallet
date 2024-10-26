import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:sixdot/screens/signin_screen.dart';
import '../widgets/bottom_navigation_bar.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF03000A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Picture with Edit Option
                Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                                'assets/profile_image.png'), // User's profile picture
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                              icon: const Icon(Icons.edit, color: Colors.white),
                              onPressed: () {
                                // Logic to edit profile image
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Edit Image',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Account Section
                _buildSectionHeader('Account', Icons.account_circle),
                _buildProfileOption(context, 'Personal Info', Icons.person),
                _buildProfileOption(context, 'Security', Icons.lock),
                _buildProfileOption(
                    context, 'Notifications', Icons.notifications),

                const SizedBox(height: 20),

                // App Preferences Section
                _buildSectionHeader('App Preferences', Icons.settings),
                _buildProfileOption(context, 'Theme', Icons.color_lens),
                _buildProfileOption(context, 'Currency', Icons.attach_money),

                const SizedBox(height: 20),

                // Support Section
                _buildSectionHeader('Support', Icons.support),
                _buildProfileOption(context, 'Get Help', Icons.help),
                _buildProfileOption(context, 'Rate Sixdot Wallet', Icons.star),
                _buildProfileOption(
                    context, 'Terms and Conditions', Icons.article),
                _buildProfileOption(
                    context, 'Privacy Policy', Icons.privacy_tip),

                const SizedBox(height: 20),

                // Logout Section
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.redAccent, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: 4, // Set the index for the profile screen
        onTap: (index) {
          if (index == 0) {
            // Navigate to home screen
            Navigator.pushNamed(context, '/home');
          }
          // Handle other navigation as needed
        },
      ),
    );
  }

// ... Rest of your ProfileScreen code remains unchanged
}


// Helper to create section headers
  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // Helper to create options inside the profile sections
  Widget _buildProfileOption(BuildContext context, String title,
      IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: () {
        // Navigate to respective screens
      },
    );
  }