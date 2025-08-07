import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  final String imagePath;
  final String label;

  const CustomBanner({
    super.key,
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(imagePath, height: 160, width: double.infinity, fit: BoxFit.cover),
          Container(
            color: Colors.black.withOpacity(0.3),
            alignment: Alignment.center,
            height: 160,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
        ],
      ),
    );
  }
}