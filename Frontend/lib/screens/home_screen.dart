import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart'; // For icons like scan, etc.
import 'package:sixdot/screens/create_fiat_home_screen.dart';
import 'package:sixdot/screens/send_crypto_screen.dart';
import 'package:sixdot/screens/receive_crypto_screen.dart';
import 'package:sixdot/screens/swap_crypto_screen.dart';
import 'package:sixdot/widgets/gradient_switch.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isCrypto = true; // Track whether crypto or fiat is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF03000A),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildUserDetailsCard(), // Combined card covering full width
            const SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
              child: _buildAssetsList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserDetailsCard() {
    return Container(
      width: double.infinity, // Full width of the screen
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        gradient: LinearGradient(
          colors: [Color(0xFF5B4CDB), Color(0xFFA142F8)],
          stops: [0.32, 0.77],
          begin: Alignment.topLeft, // Start of the gradient
          end: Alignment.bottomRight, // End of the gradient
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          // Added 40px space before the row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hello Charles',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 44),

              // Replace the Switch with GradientSwitch
              GradientSwitch(
                value: isCrypto,
                onChanged: (value) {
                  setState(() {
                    isCrypto = value;
                  });
                  if (!isCrypto) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateFiatHomeScreen()),
                    );
                  }
                },
                activeThumbGradient: const LinearGradient(
                  colors: [Color(0xFF5B4CDB), Color(0xFFA142F8)],
                ),
                inactiveThumbGradient: const LinearGradient(
                  colors: [Color(0xFF5B4CDB), Color(0xFFA142F8)],
                ),
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.white,
              ),

              const SizedBox(width: 0),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.help_outline, size: 24, color: Colors.white),
                    onPressed: () {
                      // Help action
                    },
                  ),
                  const SizedBox(width: 0),
                  IconButton(
                    icon: const Icon(Icons.notifications_none, size: 24, color: Colors.white),
                    onPressed: () {
                      // Notifications action
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 0),
          const Row(
            children: [
              Text(
                '3453 **** 4563',
                style: TextStyle(fontSize: 13, color: Colors.white70),
              ),
              SizedBox(width: 10),
              Icon(Icons.copy, size: 16, color: Colors.white),
            ],
          ),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Total Asset Value',
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Text(
                        '0.00',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      DropdownButton<String>(
                        value: 'USD',
                        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                        underline: Container(),
                        dropdownColor: Colors.blue,
                        items: <String>['USD', 'EUR', 'GBP'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            // Update currency logic
                          });
                        },
                      ),
                    ],
                  ),
                  const Text(
                    '=0.000000012 BTC',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildActionButtons(), // Action buttons inside the card
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionButton('Send', Icons.arrow_upward, () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SendCryptoScreen()), // Navigate to SendCryptoScreen
          );
        }),
        _buildActionButton('Receive', Icons.arrow_downward, () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ReceiveCryptoScreen()), // Corrected screen name
          );
        }),
        _buildActionButton('Swap', Icons.swap_horiz, () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SwapCryptoScreen()), // Corrected screen name
          );
        }),
        _buildActionButton('Buy', Icons.shopping_bag),
      ],
    );
  }

  Widget _buildActionButton(String label, IconData icon, [VoidCallback? onPressed]) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed, // Add the onTap event for the button
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFCDA6FE),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildAssetsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Assets',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4, // Dummy asset count
          itemBuilder: (context, index) {
            return _buildAssetCard(index);
          },
        ),
      ],
    );
  }

  Widget _buildAssetCard(int index) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: [Color(0xFF5B4CDB), Color(0xFFA142F8)],
            stops: [0.32, 0.77],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.6),
          ),
          title: const Text(
            'Bitcoin',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: const Text(
            'N12,113,453.56',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          trailing: const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'N5.67',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '0 BTC',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF03000A),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      // Default selected index, update based on selection
      onTap: (index) {
        if (index == 4) {
          // Navigate to profile screen
          Navigator.pushNamed(context, '/profile');
        }
        // Handle other navigation as needed
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.swap_horiz),
          label: 'Switch',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: 'Transfer',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesome.qrcode),
          label: 'Scan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
