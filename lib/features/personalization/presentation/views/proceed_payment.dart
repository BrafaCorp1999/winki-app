import 'package:flutter/material.dart';
import 'package:wink/features/personalization/presentation/views/checkout_view.dart';
import 'package:wink/features/personalization/presentation/views/order_confirmed.dart';
import 'package:wink/features/personalization/presentation/views/shipping_select_view.dart';
import 'package:wink/core/utils/helpers/helper_functions.dart';  // Asegúrate de agregar esta línea si no está importado


class ProceedPayment extends StatelessWidget {
  const ProceedPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
     
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            children: [
              // Producto 1
              _buildProductItem(
                imagePath: 'assets/images/products/vestido_rojo.png',
                productName: 'Donatello',
                productSize: 'Cream elegant',
                price: '€ 398.90',
                quantity: 1,
              ),
              const Divider(color: Colors.grey),
              // Producto 2
              _buildProductItem(
                imagePath: 'assets/images/products/shoes.png',
                productName: 'ngcgh',
                productSize: 'Cream elegant',
                price: '€ 398.90',
                quantity: 1,
              ),
              const Divider(color: Colors.grey),
              // Producto 3
              _buildProductItem(
                imagePath: 'assets/images/products/model.png',
                productName: 'Donatello',
                productSize: 'Cream elegant',
                price: '€ 398.90',
                quantity: 1,
              ),
              const Divider(color: Colors.grey),
              // Producto 4
              _buildProductItem(
                imagePath: 'assets/images/products/bolso.png',
                productName: 'Donatello',
                productSize: 'Cream elegant',
                price: '€ 398.90',
                quantity: 1,
              ),

              // Resumen del pedido
              const SizedBox(height: 10),
              Container(
                height: 170,
                padding: const EdgeInsets.all(8),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sub total (4 product)",
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                    const SizedBox(height: 8),
                    Text("Shipping", style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text("Total",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                     SizedBox(height: 16),

                    Row(

                              children: [
                                   SizedBox(
                        height:40,
                        width:140,
                    child:
                                ElevatedButton(
                      onPressed: () {
                       // Navigator.push(context, MaterialPageRoute(builder: (_) => const ShippingSelectionView()));

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF5DDD8),
                        
                      ),
                      child:  Text("Ir a la orden", style: TextStyle(fontSize: 11,color: Colors.white)),
                    ),),
                                 SizedBox(width: 16),
                                    SizedBox(
                        height:40,
                        width:140,
                    child:
                                 ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => OrderConfirmed()));

                      },
                      style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF28482),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                      child: const Text("Continuar Comprando",style: TextStyle(fontSize: 11, color: Colors.white),),
                    ),)
                              ],
                            ),
                    
                     
                  
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductItem({
    required String imagePath,
    required String productName,
    required String productSize,
    required String price,
    required int quantity,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          // Imagen del producto
          Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.cover),
          const SizedBox(width: 12),
          // Información del producto
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productName, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(productSize),
                const SizedBox(height: 8),
                Text(price, style: TextStyle(color: Colors.black, fontSize: 16)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Cantidad
                    Text("Quantity: $quantity",
                        style: TextStyle(fontSize: 14, color: Colors.black)),
                    const SizedBox(width: 10),
                    // Ícono de basurero para eliminar
                    IconButton(
                      onPressed: () {
                        // Lógica para eliminar el producto
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
