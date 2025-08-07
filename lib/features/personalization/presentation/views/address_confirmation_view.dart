import 'package:flutter/material.dart';
import 'package:wink/features/shop/presentation/views/new_home_view.dart';
import 'package:wink/features/shop/presentation/views/all_brands_view.dart';
import 'package:wink/features/personalization/presentation/views/settings_view.dart';
import 'package:wink/features/personalization/presentation/views/new_settings_view.dart';
import 'package:wink/features/personalization/presentation/views/faq_view.dart';
import 'package:wink/features/personalization/presentation/views/bag_view.dart';
import 'package:wink/features/personalization/presentation/views/address_form_view.dart';
import 'package:wink/features/personalization/presentation/views/payment_method_view.dart';

class AddressConfirmationView extends StatefulWidget {
//   final String fullAddress;
//   final String addressDetails;
//   final String shippingType;
//   final String deliveryTime;
//   final String specialNotes;

  const AddressConfirmationView({
    super.key,
    //required this.fullAddress,
    // this.addressDetails = "Colle Gran Vía, 28, 6ºB, 28019 Mostel\nComunicacao as Montes Espana",
    // this.shippingType = "Envio Express",
    // this.deliveryTime = "1 - 2 dias incluites",
    // this.specialNotes = "FINOCLICIA: A PASCUA",
  });

  @override
  State<AddressConfirmationView> createState() => _AddressConfirmationView();

}
class _AddressConfirmationView extends State<AddressConfirmationView> {

  int _selectedIndex = 2; // Mantiene el índice para el BottomNavigationBar
  int _currentStep = 1; // Controla el paso actual del stepper
   List<Widget> _screens = [
     NewHomeView(),
     AllBrandsView(),
     Container(), // Placeholder para esta vista
     NewSettingsView(),
  ];


  void _onItemTapped(int index) {
    if (index == 2) return; // Si clickea en el bag (índice 2), no hace nada porque ya estamos aquí
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => _screens[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: const Color(0xFFF8F8F8),


      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Container(
          margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFF4EFE9),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'Dirección de envío',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomStepper(currentStep: 1), // Mantiene el paso 1
            
            const SizedBox(height: 24),
            
            // Tarjeta de dirección
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dirección de envío',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  // Dirección principal
                  Text(
                    "direccion: ...........",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  
                  // Detalles de dirección (lista)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: "absoñfboñasbdoasbdoasbopdasbopdasbopdasbopdasbopdasbopdabsdopasdbopa".split('\n').map((line) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('• ', style: TextStyle(fontSize: 16)),
                            Expanded(child: Text(line)),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  
                  // Tipo de envío
                  Row(
                    children: [
                      const Icon(Icons.local_shipping, color: Color(0xFFF28482)),
                      const SizedBox(width: 8),
                      Text(
                        "Envio Express",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text("1 - 2 dias hábiles"),
                  
                  const SizedBox(height: 16),
                  
                  // Notas especiales
                //   if ("specialNotes.isNotEmpty")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(),
                        const SizedBox(height: 8),
                        Text(
                          "",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Botón de confirmación
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentMethodSingleView(), // Tu siguiente vista de pago
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF28482),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Proceder a Pagar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: 2,
            onTap: _onItemTapped,
            selectedItemColor: const Color(0xFFFC857D),
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view),
                label: 'Categorías',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: 'Bag',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Me',
              ),
            ],
          ),
        ),
      ),
      // ... (tu BottomNavigationBar existente)
    );
  }
}
class CustomStepper extends StatelessWidget {
  final int currentStep;
  
  const CustomStepper({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStep(1, "Envio", currentStep >= 1),
          _buildLine(currentStep >= 2),
          _buildStep(2, "Pago", currentStep >= 2),
          _buildLine(currentStep >= 3),
          _buildStep(3, "Verificación", currentStep >= 3),
        ],
      ),
    );
  }

  Widget _buildStep(int number, String text, bool isActive) {
    return Column(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFFF28482) : Colors.grey[400],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$number',
              style: TextStyle(
                //color: isActive ? Colors.white : Colors.grey,
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            color: isActive ? const Color(0xFFF28482) : Colors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _buildLine(bool isActive) {
    return Expanded(
      child: Container(
        height: 2,
        color: isActive ? const Color(0xFFF28482) : Colors.grey[300],
        margin: const EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }
}