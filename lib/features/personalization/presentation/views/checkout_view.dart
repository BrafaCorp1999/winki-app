import 'package:flutter/material.dart';
import 'package:wink/features/shop/presentation/view_models/city_location.dart';
import 'package:wink/features/personalization/presentation/views/shipping_select_view.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  _CheckoutViewState createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  int currentStep = 1; // Para controlar el paso actual
  
  // Función para cambiar al siguiente paso
  void nextStep() {
    if (currentStep < 3) {
      setState(() {
        currentStep++;
      });
    }
  }

  // Función para retroceder al paso anterior
  void previousStep() {
    if (currentStep > 1) {
      setState(() {
        currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFFF8F8F8),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           // AppBar tipo "pill"
        
          children: [
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
            // Indicador de pasos (1, 2, 3)
            // StepProgressIndicator(
            //   totalSteps: 3,
            //   currentStep: currentStep,
            //   selectedColor: Colors.orange,
            //   unselectedColor: Colors.grey,
            //   roundedEdges: Radius.circular(10),
            //   size: 40,
            // ),
            const SizedBox(height: 20),

            // Mostrar el paso actual
            if (currentStep == 1) _buildStepOne(),
            if (currentStep == 2) _buildStepTwo(),
            if (currentStep == 3) _buildStepThree(),

            const SizedBox(height: 20),

            // Botones para avanzar entre pasos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentStep > 1)
                  ElevatedButton(
                    onPressed: previousStep,
                    child: const Text("Previous"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  ),
                if (currentStep < 3)
                  ElevatedButton(
                    onPressed: nextStep,
                    child: const Text("Next"),
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF28482)),
                  ),
                if (currentStep == 3)
                  ElevatedButton(
                    onPressed: () {
                      // Aquí va la lógica para confirmar el pedido

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => 
                          ShippingSelectionView(
                            
                          ),
                        ),
                      );  
                   
                    },
                    child: const Text("Confirm Order"),
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF28482)),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepOne() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Step 1: Delivery",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        // Información del pedido (puedes poner lo que necesites)
        ListTile(
          title: const Text("Delivery to my address"),
          subtitle: const Text("Home / Office address"),
          leading: Radio(
            value: "home",
            groupValue: "home",
            onChanged: (value) {},
          ),
        ),
        ListTile(
          title: const Text("Delivery to store"),
          subtitle: const Text("Pick up from nearest store"),
          leading: Radio(
            value: "store",
            groupValue: "home",
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }

  Widget _buildStepTwo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Step 2: Payment Information",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        // Formulario de pago (puedes agregar campos como tarjeta, método de pago, etc.)
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Credit Card Number',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Expiry Date',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'CVV',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildStepThree() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Step 3: Confirmation",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        // Aquí puedes mostrar el resumen del pedido o confirmar
        const Text(
          "Please review your order before confirming.",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        // Aquí mostrarías el resumen del pedido, precio y más detalles
        // Puedes agregar una lista de productos seleccionados, precio, etc.
      ],
    );
  }
}
