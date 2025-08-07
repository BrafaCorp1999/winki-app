import 'package:flutter/material.dart';
import 'package:wink/features/personalization/presentation/views/order_history_view.dart';
import 'package:wink/features/personalization/presentation/views/faq_view.dart';
import 'package:wink/features/personalization/presentation/views/location_list_view.dart';

class NewSettingsView extends StatelessWidget {
  const NewSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 14),

            // Perfil
            Center(
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/images/reviews/review_profile_image_2.jpeg"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Bryan Laska",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    "Bryan.Laska@gmail.com",
                    style: TextStyle(color: Colors.black45, fontSize: 13),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Opciones destacadas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                    ListTile(
  leading: Image.asset('assets/icons/history.png', width: 24),
  title: const Text("Historial de mompra"),
  onTap: () {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const OrderHistoryView()));
  },
),
ListTile(
  leading: Image.asset('assets/icons/question.png', width: 24),
  title: const Text("FAQ"),
  onTap: () {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const FAQView()));
  },
),
ListTile(
  leading: Image.asset('assets/icons/flag.png', width: 24),
  title: const Text("España"),
  onTap: () {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const LocationListView()));
  },
),
                ],
              ),
            ),

            const SizedBox(height: 6),
            const Divider(height: 1),

            // Lista adicional
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _SimpleTextItem("Cambiar contraseña"),
                  _SimpleTextItem("Política de privacidad"),
                  _SimpleTextItem("Reembolso"),
                  _SimpleTextItem("Chatear con el administrador"),
                  _SimpleTextItem("Sobre WINK"),
                  _SimpleTextItem("Devolución"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFFFF6D5B)),
          const SizedBox(width: 16),
          Text(label, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
  Widget _buildOptionImageIcon(String iconPath, String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Image.asset(iconPath, width: 24, height: 24),
        const SizedBox(width: 16),
        Text(label, style: const TextStyle(fontSize: 16)),
      ],
    ),
  );
}


  Widget _buildOptionImage(String iconPath, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.asset(iconPath, width: 24, height: 24),
          const SizedBox(width: 16),
          Text(label, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class _SimpleTextItem extends StatelessWidget {
  final String label;
  const _SimpleTextItem(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(label, style: const TextStyle(fontSize: 14)),
    );
  }
}
