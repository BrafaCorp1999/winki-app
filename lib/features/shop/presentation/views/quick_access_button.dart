import 'package:flutter/material.dart';

class QuickAccessButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color iconColor;

  const QuickAccessButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.backgroundColor = const Color(0xFFF5DDD8), // baby pink
    this.iconColor = Colors.black,
  });

final Color lightFrenchBeige = const Color(0xFFD0A583); // Fondo principal
final Color bittersweetShimmer = const Color(0xFFBA4353); // Encabezados y elementos destacados
final Color oliveDrabCamouflage = const Color.fromARGB(100, 158, 143, 47);// Botones principales (marrón)
final Color od = const Color.fromARGB(10, 85, 73, 64); // Color secundario/acentos
final Color citron = const Color(0xFFAD9F22); // Color secundario/acentos

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(100, 158, 143, 47),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(20),
            child: Icon(icon, size: 32, color: iconColor),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}