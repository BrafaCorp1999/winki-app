import 'package:flutter/material.dart';
import 'package:wink/features/shop/presentation/views/new_home_view.dart';
import 'package:wink/features/shop/presentation/views/all_brands_view.dart';
import 'package:wink/features/personalization/presentation/views/settings_view.dart';
import 'package:wink/features/personalization/presentation/views/new_settings_view.dart';
import 'package:wink/features/personalization/presentation/views/faq_view.dart';
import 'package:wink/features/personalization/presentation/views/bag_view.dart';
import 'package:wink/features/personalization/presentation/views/address_form_view.dart';
import 'package:wink/features/personalization/presentation/views/map_confirmation_view2.dart';


class AddressFormView extends StatefulWidget {
  const AddressFormView({super.key});

  @override
  State<AddressFormView> createState() => _AddressFormView();
}

class _AddressFormView extends State<AddressFormView> {
  
  int _selectedIndex = 2; // Mantiene el índice para el BottomNavigationBar
  int _currentStep = 1; // Controla el paso actual del stepper
  bool _isSelected = false;

  final List<Widget> _screens = [
    const NewHomeView(),
    const AllBrandsView(),
    Container(), // Placeholder para esta vista
    const NewSettingsView(),
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
              'Orden',
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
      body: Column(
          children: [

            const SizedBox(height: 16),
            const CustomStepper(currentStep: 1), // Mantiene en paso 1
            const SizedBox(height: 24),
            
            // Formulario de dirección
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildFormField('Nombre completo', Icons.person),
                  const SizedBox(height: 16),
                  _buildFormField('Dirección', Icons.home),
                  const SizedBox(height: 16),
                  _buildFormField('Ciudad', Icons.location_city),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: _buildFormField('Código postal', Icons.markunread_mailbox),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 1,
                        child: _buildFormField('Estado', Icons.map),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildFormField('Teléfono', Icons.phone),
                  
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Future.delayed(const Duration(milliseconds: 300), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MapConfirmationView2(address:"",city:"",province:"",postalCode:"")),
                      );
                    });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF28482),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Guardar dirección',
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
          ],
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
            currentIndex: 0,
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
    );
  }
   Widget _buildFormField(String label, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFFF28482)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFF28482)),
        ),
      ),
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