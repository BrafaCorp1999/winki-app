import 'package:flutter/material.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 50),

          // Pill AppBar
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
                        "Order History",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Tabs (solo visual por ahora)
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildTab("Not yet paid"),
                _buildTab("Packed"),
                _buildTab("Done", active: true),
                _buildTab("Cancel"),
                _buildTab("Return"),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Body scroll
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildOrderSection(
                  context,
                  dateLabel: "TODAY, 12:10 AM",
                  productImage: "assets/images/products/bolso.png",
                  title: "Hermes",
                  subtitle: "Antelope",
                  color: Colors.blue,
                  price: "400.00",
                  oldPrice: "450.00",
                ),
                _buildOrderSection(
                  context,
                  dateLabel: "YESTERDAY, 03:12 AM",
                  productImage: "assets/images/products/vestido.png",
                  title: "Expand",
                  subtitle: "Safiya Printing Dress",
                  color: Colors.brown,
                  price: "98.99",
                  oldPrice: "115.00",
                ),
                _buildOrderSection(
                  context,
                  dateLabel: "YESTERDAY, 03:12 AM",
                  productImage: "assets/images/products/vestido2.png",
                  title: "Hush Puppies",
                  subtitle: "Amory",
                  color: Colors.red,
                  price: "324.99",
                  oldPrice: "",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String text, {bool active = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Text(
        text,
        style: TextStyle(
          color: active ? Colors.pink : Colors.black54,
          fontWeight: active ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildOrderSection(
    BuildContext context, {
    required String dateLabel,
    required String productImage,
    required String title,
    required String subtitle,
    required Color color,
    required String price,
    String oldPrice = "",
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 32, thickness: 0.5),
        Text(dateLabel, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(height: 8),

        // Direcciones
        Row(
          children: [
            const Icon(Icons.location_on, size: 14, color: Colors.black54),
            const SizedBox(width: 5),
            const Expanded(
              child: Text("3517 W. Gray St. Utica, Pennsylvania 57867", style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.location_on, size: 14, color: Colors.green),
            const SizedBox(width: 5),
            const Expanded(
              child: Text("6391 Elgin St. Celina, Delaware 10299", style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
        const SizedBox(height: 10),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Info textual
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text(subtitle, style: const TextStyle(color: Colors.black45)),
                  const SizedBox(height: 10),
                  Text("ORDER AGAIN", style: TextStyle(color: Colors.pink.shade400, fontSize: 13)),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text("\$$price", style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 10),
                      if (oldPrice.isNotEmpty)
                        Text("\$$oldPrice",
                            style: const TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                            )),
                    ],
                  )
                ],
              ),
            ),

            // Imagen
            const SizedBox(width: 10),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    productImage,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 4),
                Text("(1 item)", style: const TextStyle(fontSize: 12, color: Colors.grey)),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
