import 'package:flutter/material.dart';
import 'package:wink/features/shop/presentation/views/new_home_view.dart';
import 'package:wink/features/shop/presentation/views/all_brands_view.dart';
import 'package:wink/features/personalization/presentation/views/settings_view.dart';
import 'package:wink/features/personalization/presentation/views/new_settings_view.dart';
import 'package:wink/features/personalization/presentation/views/faq_view.dart';
import 'package:wink/features/personalization/presentation/views/bag_view.dart';
import 'package:wink/features/personalization/presentation/views/address_form_view.dart';
import 'package:wink/features/personalization/presentation/views/proceed_payment.dart';

class PaymentMethodSingleView extends StatefulWidget {
  const PaymentMethodSingleView({super.key});

  @override
  State<PaymentMethodSingleView> createState() => _PaymentMethodSingleViewState();
}

class _PaymentMethodSingleViewState extends State<PaymentMethodSingleView> {
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
  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardNameController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 12, left: 12, bottom: 90),
        child: Column(
          children: [
            const SizedBox(height: 8),
            const CustomStepper(currentStep: 2), // Paso 2: Pago
            const SizedBox(height: 12),
            
            // Título
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Elige la forma de pago',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Opción 1: Tarjeta de crédito/débito
            GestureDetector(
              onTap: () => setState(() => _selectedMethod = 0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _selectedMethod == 0 
                        ? const Color(0xFFF28482) 
                        : Colors.grey[300]!,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          _selectedMethod == 0 
                              ? Icons.radio_button_checked 
                              : Icons.radio_button_off,
                          color: _selectedMethod == 0 
                              ? const Color(0xFFF28482) 
                              : Colors.grey,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "Credito / Debito",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Visa, Master Card",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    
                    // Formulario de tarjeta (visible solo si está seleccionado)
                    if (_selectedMethod == 0) ...[
                      const SizedBox(height: 16),
                      const Text(
                        'Es un pago seguro con encriptación SSL de 128 bits. FastPay protegido.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Tarjetas aceptadas (simuladas con texto)
                      const Wrap(
                        spacing: 16,
                        children: [
                          Text('Visa', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('MasterCard', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('PayPal', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 24),
                      
                      // Formulario de tarjeta
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _cardNumberController,
                              decoration: InputDecoration(
                                labelText: 'Número en la tarjeta',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: const Icon(Icons.credit_card),
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor ingrese el número de tarjeta';
                                }
                                if (value.length < 16) {
                                  return 'Número de tarjeta inválido';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            
                            TextFormField(
                              controller: _cardNameController,
                              decoration: InputDecoration(
                                labelText: 'Nombre en la tarjeta',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: const Icon(Icons.person),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor ingrese el nombre';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _expiryDateController,
                                    decoration: InputDecoration(
                                      labelText: 'Exp MM/YYYY',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      prefixIcon: const Icon(Icons.calendar_today),
                                    ),
                                    keyboardType: TextInputType.datetime,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Ingrese fecha';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: TextFormField(
                                    controller: _cvvController,
                                    decoration: InputDecoration(
                                      labelText: 'CVV',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      prefixIcon: const Icon(Icons.lock),
                                    ),
                                    keyboardType: TextInputType.number,
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Ingrese CVV';
                                      }
                                      if (value.length < 3) {
                                        return 'CVV inválido';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            
                            const Text(
                              'No se te cobrará hasta que el proceso de pedido esté completo.',
                              style: TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            
            // // Opción 2: Transferencia bancaria (deshabilitada)
            // GestureDetector(
            //   onTap: null, // Deshabilitado
            //   child: Container(
            //     padding: const EdgeInsets.all(16),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(12),
            //       border: Border.all(
            //         color: _selectedMethod == 1 
            //             ? const Color(0xFFF28482) 
            //             : Colors.grey[200]!,
            //         width: 2,
            //       ),
            //     ),
            //     child: Row(
            //       children: [
            //         Icon(
            //           Icons.radio_button_off,
            //           color: Colors.grey[200],
            //         ),
            //         const SizedBox(width: 12),
            //         const Text(
            //           "Vía transferencia bancaria",
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             color: Colors.grey,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 12),
            
            // // Opción 3: Contra entrega (deshabilitada)
            // GestureDetector(
            //   onTap: null, // Deshabilitado
            //   child: Container(
            //     padding: const EdgeInsets.all(16),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(12),
            //       border: Border.all(
            //         color: _selectedMethod == 2 
            //             ? const Color(0xFFF28482) 
            //             : Colors.grey[200]!,
            //         width: 2,
            //       ),
            //     ),
            //     child: Row(
            //       children: [
            //         Icon(
            //           Icons.radio_button_off,
            //           color: Colors.grey[200],
            //         ),
            //         const SizedBox(width: 12),
            //         const Text(
            //           "Pagar contra entrega",
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             color: Colors.grey,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 24),
            
           
              SizedBox(
                
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                   
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProceedPayment(),
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
                    'Continuar',
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
        margin: const EdgeInsets.only(left: 24, right: 24, bottom: 36),
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