import 'package:flutter/material.dart';

class FAQView extends StatefulWidget {
  const FAQView({super.key});

  @override
  State<FAQView> createState() => _FAQViewState();
}

class _FAQViewState extends State<FAQView> {
  List<bool> _expanded = List.generate(12, (_) => false);

  final List<Map<String, String>> _faqList = [
    {"title": "Preguntas generales", "content": "Aquí encontrarás las preguntas mas frecuentes acerca de la app."},
    {"title": "Cómo hacer un pedido", "content": "You can order by selecting your products and proceeding to checkout."},
    {"title": "Método de pago", "content": "We accept credit cards, PayPal, and bank transfers."},
    {"title": "Descuento", "content": "We offer seasonal discounts and coupon codes."},
    {"title": "Envío", "content": "Shipping is done within 3–5 business days."},
    {"title": "Guía de tallas y cantidades", "content": "Check our size chart for accurate measurements."},
    {"title": "Características de Wink", "content": "OYAYUBI provides unique AI recommendations."},
    {"title": "Sobre la cuenta", "content": "We follow WHO safety protocols in all operations."},
    {"title": "Política de privacidad", "content": "You can manage your account settings from your profile."},
    {"title": "Términos y condicionales", "content": "We never share your data with third parties."},
    {"title": "Contáctanos", "content": "By using our service, you agree to our terms."},
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: Column(
        children: [
          const SizedBox(height: 50),

          // AppBar tipo "pill"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF4EDE4),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new, size: 20),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "FAQ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
            ),
          ),

          const SizedBox(height: 15),

          Expanded(
            child: ListView.separated(
              itemCount: _faqList.length,
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                color: Color(0xFFE0E0E0),
                indent: 20,
                endIndent: 20,
              ),
              itemBuilder: (context, index) {
                final item = _faqList[index];
                return _buildExpansionTile(item["title"]!, item["content"]!, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpansionTile(String title, String content, int index) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 20),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      initiallyExpanded: _expanded[index],
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      children: [
        Text(
          content,
          style: const TextStyle(color: Colors.black54, fontSize: 14),
        ),
      ],
      onExpansionChanged: (expanded) {
        setState(() {
          _expanded[index] = expanded;
        });
      },
      trailing: Icon(
        _expanded[index] ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
        color: Colors.black54,
      ),
    );
  }
}
