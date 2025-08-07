import 'package:flutter/material.dart';

class QuickAccessIconButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback? onPressed;

  const QuickAccessIconButton({
    super.key,
    required this.iconPath,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          InkWell(
            onTap: onPressed,
            child: Container(
              width: 110,
              height: 130,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child:
              
              Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 3),
              Image.asset(iconPath),
        ])
            ),
          ),
          
        ],
      ),
    );
  }
}