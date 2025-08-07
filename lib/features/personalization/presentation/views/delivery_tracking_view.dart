import 'package:flutter/material.dart';
import 'package:wink/features/personalization/presentation/views/new_settings_view.dart';
import 'package:wink/features/shop/presentation/views/all_brands_view.dart';
import 'package:wink/features/shop/presentation/views/new_home_view.dart';

class DeliveryTrackingView extends StatelessWidget {
   DeliveryTrackingView({super.key});

  int _selectedMethod = 0; // 0: Tarjeta, 1: Transferencia, 2: Contra entrega
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _cardNameController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  int _selectedIndex = 2; // Mantiene el índice para el BottomNavigationBar
  int _currentStep = 2; // Controla el paso actual del stepper
  bool _isSelected = false;
  List<Widget> _screens = [
     NewHomeView(),
     AllBrandsView(),
     Container(), // Placeholder para esta vista
     NewSettingsView(),
  ];

  _onItemTapped(int index, context) {
    if (index == 2) return; // Si clickea en el bag (índice 2), no hace nada porque ya estamos aquí
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => _screens[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4EFE9),
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
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
              'Dirección De Entrega',
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
            //const CustomStepper(currentStep: 3), // Paso 3: Verificación
            const SizedBox(height: 24),
            
            // Dirección de entrega
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Calle Dos Nolas, 123, 21029 Madrid España',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Tiempo de entrega
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tiempo de entrega',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Entrega estimada: 25 min',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Estado del pedido
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Opción 1
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: null,
                        activeColor: const Color(0xFFF28482),
                      ),
                      const SizedBox(width: 8),
                      const Text('la posición es sólo asegurado',style: TextStyle(fontSize: 11)),
                      const Spacer(),
                      const Text('2 m/s'),
                    ],
                  ),
                  
                  // Opción 2
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: null,
                        activeColor: const Color(0xFFF28482),
                      ),
                      const SizedBox(width: 8),
                      const Text('la posición está en camino',style: TextStyle(fontSize: 11)),
                      const Spacer(),
                      const Text('0 m/s'),
                    ],
                  ),
                  
                  // Opción 3
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: null,
                        activeColor: const Color(0xFFF28482),
                      ),
                      const SizedBox(width: 8),
                      const Text('la posición ha llegado',style: TextStyle(fontSize: 11)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Botón de rastreo
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Acción para rastrear pedido
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF28482),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Rostrear Pedido',
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
            currentIndex: _selectedIndex,
            onTap: _onItemTapped(_selectedIndex, context),
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