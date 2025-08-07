import 'package:flutter/material.dart';
import 'package:wink/features/personalization/presentation/views/map_confirmation_view.dart';
import 'package:wink/features/shop/presentation/view_models/city_location.dart';
import 'package:wink/features/shop/presentation/view_models/city_location.dart';

class LocationListView extends StatefulWidget {
  const LocationListView({super.key});

  @override
  State<LocationListView> createState() => _LocationListViewState();
}

class _LocationListViewState extends State<LocationListView> {
  String? _selectedCity;

  final List<Map<String, dynamic>> locations = [
    {'name': 'Madrid', 'lat': 40.4168, 'lng': -3.7038},
    {'name': 'Barcelona', 'lat': 41.3874, 'lng': 2.1686},
    {'name': 'Valencia', 'lat': 39.4699, 'lng': -0.3763},
    {'name': 'Sevilla', 'lat': 37.3891, 'lng': -5.9845},
    {'name': 'Zaragoza', 'lat': 41.6488, 'lng': -0.8891},
    {'name': 'Málaga', 'lat': 36.7213, 'lng': -4.4214},
    {'name': 'Bilbao', 'lat': 43.2630, 'lng': -2.9349},
    {'name': 'Murcia', 'lat': 37.9922, 'lng': -1.1307},
    {'name': 'Palma', 'lat': 39.5696, 'lng': 2.6502},
    {'name': 'San Sebastián', 'lat': 43.3213, 'lng': -1.9857},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCF6),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            // Custom pill AppBar
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

            const SizedBox(height: 16),

            // Buscador no funcional
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search location',
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Lista de ciudades
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: locations.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final city = locations[index];
                  return RadioListTile<String>(
                    value: city['name'],
                    groupValue: _selectedCity,
                    title: Text(city['name']),
                    activeColor: Colors.deepOrange,
                    onChanged: (value) {
                      setState(() {
                        _selectedCity = value;
                      });

                      // Ir a mapa
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MapConfirmationView(
                            cityName: city['name'],
                            latitude: city['lat'],
                            longitude: city['lng'],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
