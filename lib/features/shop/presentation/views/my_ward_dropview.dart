// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class MyWardrobeView extends StatefulWidget {
//   const MyWardrobeView({super.key});

//   @override
//   State<MyWardrobeView> createState() => _MyWardrobeViewState();
// }

// class _MyWardrobeViewState extends State<MyWardrobeView> {
//   String selectedCategory = 'All';

//   final Map<String, List<Map<String, String>>> wardrobeItems = {
//     'Shoes': [
//       {'image': 'assets/images/wardrobe/shoe1.png', 'name': 'Brown tight'},
//       {'image': 'assets/images/wardrobe/shoe2.png', 'name': 'Blue candy'},
//       {'image': 'assets/images/wardrobe/shoe3.png', 'name': 'Blue candy'},
//     ],
//     'Jackets': [
//       {'image': 'assets/images/wardrobe/jacket1.png', 'name': 'Gray bomber'},
//       {'image': 'assets/images/wardrobe/jacket2.png', 'name': 'Peach wind'},
//     ],
//     'Dresses': [
//       {'image': 'assets/images/wardrobe/dress1.png', 'name': 'ZIZI'},
//       //{'image': 'assets/images/wardrobe/dresses/dress2.png', 'name': 'ZIZI'},
//     ],
//   };

//   void _showImageSourceSelector() {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.white,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//       ),
//       builder: (_) => SizedBox(
//         height: 150,
//         child: Column(
//           children: [
//             ListTile(
//               leading: const Icon(Icons.camera_alt, color: Colors.pink),
//               title: const Text('Camera'),
//               onTap: () {
//                 Navigator.pop(context);
//                 _pickImage(ImageSource.camera);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.photo_library, color: Colors.pink),
//               title: const Text('Gallery'),
//               onTap: () {
//                 Navigator.pop(context);
//                 _pickImage(ImageSource.gallery);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _pickImage(ImageSource source) async {
//     final picked = await ImagePicker().pickImage(source: source);
//     if (picked != null) {
//       print("Imagen seleccionada: ${picked.path}");
//       // Aquí puedes agregar lógica para guardar o asignar categoría
//     }
//   }

//   List<Map<String, String>> _getFilteredItems() {
//     if (selectedCategory == 'All') {
//       return wardrobeItems.values.expand((e) => e).toList();
//     } else {
//       return wardrobeItems[selectedCategory] ?? [];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final List<String> categories = ['All', ...wardrobeItems.keys];
//     final items = _getFilteredItems();

//     return Scaffold(
//       backgroundColor: const Color(0xFFFCFCF6),
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(70),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           child: Container(
//             decoration: BoxDecoration(
//               color: const Color(0xFFF9F4EF),
//               borderRadius: BorderRadius.circular(30),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.shade300,
//                   blurRadius: 6,
//                   offset: const Offset(0, 4),
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//                 const Expanded(
//                   child: Center(
//                     child: Text(
//                       'Mi Armario',
//                       style: TextStyle(fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 48),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 12),
//           // Categorías
//           SizedBox(
//             height: 48,
//             child: ListView.separated(
//               scrollDirection: Axis.horizontal,
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               itemCount: categories.length,
//               separatorBuilder: (_, __) => const SizedBox(width: 8),
//               itemBuilder: (context, index) {
//                 final cat = categories[index];
//                 final isSelected = cat == selectedCategory;
//                 return ChoiceChip(
//                   label: Text(cat),
//                   selected: isSelected,
//                   onSelected: (_) {
//                     setState(() => selectedCategory = cat);
//                   },
//                   selectedColor: const Color(0xFFFF725E),
//                   backgroundColor: Colors.grey.shade200,
//                   labelStyle: TextStyle(
//                     color: isSelected ? Colors.white : Colors.black,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(height: 12),
//           // Cuadrícula de prendas
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: GridView.builder(
//                 itemCount: items.length,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 16,
//                   crossAxisSpacing: 16,
//                   childAspectRatio: 0.75,
//                 ),
//                 itemBuilder: (context, index) {
//                   final item = items[index];
//                   return Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(14),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.shade300,
//                           blurRadius: 6,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       children: [
//                         Expanded(
//                           child: ClipRRect(
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(14),
//                               topRight: Radius.circular(14),
//                             ),
//                             child: Image.asset(
//                               item['image']!,
//                               fit: BoxFit.cover,
//                               width: double.infinity,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 8, vertical: 4),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 item['name']!,
//                                 style: const TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               const Icon(
//                                 Icons.favorite,
//                                 color: Colors.red,
//                                 size: 20,
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _showImageSourceSelector,
//         label: const Text("Agregar prenda"),
//         icon: const Icon(Icons.add),
//         backgroundColor: const Color(0xFFFF725E),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:wink/core/utils/constants/colors.dart' as SnackBarType show info;
import 'package:wink/core/utils/constants/colors.dart';
import 'package:wink/core/utils/helpers/helper_functions.dart';
import 'package:wink/features/personalization/presentation/views/new_settings_view.dart';
import 'package:wink/features/shop/presentation/views/all_brands_view.dart';
import 'package:wink/features/shop/presentation/views/new_home_view.dart';

class MyClosetView extends StatelessWidget {
  MyClosetView({super.key});
  
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
              'Mí Armario',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
          children: [
            _buildCategoryItem(context,'Zapatos', 'assets/icons/zapatos.png'),
            _buildCategoryItem(context,'Blusas', 'assets/icons/blusas.png'),
            _buildCategoryItem(context,'Chamarras', 'assets/icons/chamarras.png'),
            _buildCategoryItem(context,'Vestidos', 'assets/icons/vestidos.png'),
            _buildCategoryItem(context,'Camisas', 'assets/icons/camisas.png'),
            _buildCategoryItem(context,'Pantalones', 'assets/icons/pantalones.png'),
            _buildCategoryItem(context,'Poleras', 'assets/icons/poleras.png'),
            _buildCategoryItem(context,'Accesorios', 'assets/icons/accesorios.png'),
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

  Widget _buildCategoryItem(context, String title, String iconPath) {
    return GestureDetector(
      // onTap: 
      //message(context),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Image.asset(
              iconPath,
              width: 70,
              height: 70,
              //color: const Color(0xFFF28482),
            ),
            const SizedBox(height: 12),
            
          ],
        ),
      ),
    ) 
    ;
  }
  
  void message(context) {
    THelperFunctions.showSnackBar(
        context: context,
        message: "Inicio de sesión correcto",
        
      );
  }
}