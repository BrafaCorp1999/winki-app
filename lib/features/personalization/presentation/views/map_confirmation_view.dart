import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapConfirmationView extends StatelessWidget {
  final String cityName;
  final double latitude;
  final double longitude;

  const MapConfirmationView({
    super.key,
    required this.cityName,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    final LatLng cityLatLng = LatLng(latitude, longitude);

    return Scaffold(
      
      body: 
      Stack(
        children: [
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
                        "Location",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
            ),
          ),
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: cityLatLng,
              zoom: 12,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('selected_city'),
                position: cityLatLng,
                infoWindow: InfoWindow(title: cityName),
              ),
            },
          ),
          Positioned(
            bottom: 40,
            left: 60,
            right: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pop(context); // Vuelve al perfil u origen
              },
              child: const Text(
                "Confirmar ubicación",
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
