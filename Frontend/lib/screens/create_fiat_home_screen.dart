import 'package:flutter/material.dart';
import 'package:sixdot/screens/enter_phone_number_screen.dart';
import 'package:sixdot/widgets/gradient_switch.dart';

class CreateFiatHomeScreen extends StatefulWidget {
  @override
  _CreateFiatHomeScreenState createState() => _CreateFiatHomeScreenState();
}

class _CreateFiatHomeScreenState extends State<CreateFiatHomeScreen> with SingleTickerProviderStateMixin {
  bool isCrypto = false;
  late AnimationController _controller;
  late Animation<double> _toggleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _toggleAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleSwitch(bool value) {
    setState(() {
      isCrypto = value;
      if (isCrypto) {
        _controller.forward();
        Navigator.pop(context); // Switch back to HomeScreen
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF03000A),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCreateFiatWalletCard(),
            const SizedBox(height: 20),
            _buildInfoSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateFiatWalletCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        gradient: LinearGradient(
          colors: [Color(0xFF5B4CDB), Color(0xFFA142F8)],
          stops: [0.32, 0.77],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: GradientSwitch(
                  value: isCrypto,
                  onChanged: _toggleSwitch,
                  activeThumbGradient: const LinearGradient(
                    colors: [Color(0xFF5B4CDB), Color(0xFFA142F8)],
                  ),
                  inactiveThumbGradient: const LinearGradient(
                    colors: [Color(0xFF5B4CDB), Color(0xFFA142F8)],
                  ),
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EnterPhoneNumberScreen()),
                    );
                  },
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: const Color(0xFFCDA6FE),
                    child: const Icon(Icons.add, size: 40, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Create a fiat wallet",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Access More Financial Options with Secure KYC",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const Icon(
            Icons.info_outline,
            color: Colors.white,
            size: 48,
          ),
          const SizedBox(height: 16),
          const Text(
            "By creating a fiat wallet, you'll be adding personal information to enhance your experience on this platform. This allows you to access additional services, securely manage fiat transactions, and connect with commercial banks.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
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
      onTap: (index) {
        if (index == 4) {
          Navigator.pushNamed(context, '/profile');
        }
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
          icon: Icon(Icons.qr_code_scanner),
          label: 'Scan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
    );
  }
}
