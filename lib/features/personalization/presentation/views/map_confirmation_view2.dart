import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:wink/features/personalization/presentation/views/address_confirmation_view.dart';
import 'package:wink/features/shop/presentation/views/new_home_view.dart';
import 'package:wink/features/shop/presentation/views/all_brands_view.dart';
import 'package:wink/features/personalization/presentation/views/settings_view.dart';
import 'package:wink/features/personalization/presentation/views/new_settings_view.dart';
import 'package:wink/features/personalization/presentation/views/faq_view.dart';
import 'package:wink/features/personalization/presentation/views/bag_view.dart';
import 'package:wink/features/personalization/presentation/views/address_form_view.dart';


class MapConfirmationView2 extends StatefulWidget {
  final String address;
  final String city;
  final String province;
  final String postalCode;

  const MapConfirmationView2({
    super.key,
    required this.address,
    required this.city,
    required this.province,
    required this.postalCode,
  });

  @override
  State<MapConfirmationView2> createState() => _MapConfirmationViewState();
}

class _MapConfirmationViewState extends State<MapConfirmationView2> {
  // final String city;
  // final String province;
  // final String postalCode;

  int _selectedIndex = 2; // Mantiene el índice para el BottomNavigationBar
  int _currentStep = 1; // Controla el paso actual del stepper
  bool _isSelected = false;

  final List<Widget> _screens = [
    const NewHomeView(),
    const AllBrandsView(),
    Container(), // Placeholder para esta vista
    const NewSettingsView(),
  ];

    final LatLng cityLatLng = LatLng(40.4168, -3.7038);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar:  PreferredSize(
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
              )],
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      body: 
      Stack(
      
        children: [
          const SizedBox(height: 12),
          CustomStepper(currentStep: _currentStep),
          const SizedBox(height: 12),

          Container(
            height:double.infinity,
            child:

            GoogleMap(
            initialCameraPosition: CameraPosition(
              target: cityLatLng,
              zoom: 12,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('selected_city'),
                position: cityLatLng,
                infoWindow: InfoWindow(title: "Madrid"),
              ),
            },
          ),
          ),
          
          Positioned(
            bottom: 12,
            left: 60,
            right: 60,
            child: 
            Container(
              width:100,
              child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Future.delayed(const Duration(milliseconds: 300), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AddressConfirmationView()),
                      );
              },
             
            );
            },
           child: const Text(
                "Confirmar",
                style: TextStyle(fontSize: 16),
              ),),
            )
           
          )
        ],
      )
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