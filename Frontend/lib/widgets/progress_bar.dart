import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int currentIndex;
  final int total;
  final double width;
  final double height;

  const ProgressBar({
    required this.currentIndex,
    required this.total,
    this.width = 224,
    this.height = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white, // Background bar
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          Container(
            width: (width / total) * (currentIndex + 1),
            height: height,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF9D00FF), Color(0xFF5D007F)], // Gradient colors
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
