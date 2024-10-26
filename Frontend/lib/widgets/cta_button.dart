import 'package:flutter/material.dart';

class CtaButton extends StatelessWidget {
  final String text;
  final bool isFilled;
  final VoidCallback onPressed;

  CtaButton({required this.text, this.isFilled = true, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 56,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        gradient: isFilled
            ? const LinearGradient(
          colors: [Color(0xFF5B4CDB), Color(0xFFA142F8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
            : null,
        border: !isFilled
            ? Border.all(
          width: 2,
          color: const Color(0xFFA142F8), // Use gradient color for stroke
        )
            : null,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.1)),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white, // Keep text white regardless of button style
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
