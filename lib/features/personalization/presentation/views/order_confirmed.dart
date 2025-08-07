import 'package:flutter/material.dart';
import 'package:wink/features/personalization/presentation/views/checkout_view.dart';
import 'package:wink/features/personalization/presentation/views/delivery_tracking_view.dart';
import 'package:wink/features/personalization/presentation/views/shipping_select_view.dart';

import 'package:wink/core/utils/helpers/helper_functions.dart';  // Asegúrate de agregar esta línea si no está importado


class OrderConfirmed extends StatelessWidget {
  const OrderConfirmed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF28482),
     
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child:

              Center(
                child: Column(
                  
                    children: [
                 SizedBox(
                       height: 100,
                   ),
                   Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child:
                    Image.asset("assets/logos/wink-background.png", width: 200, height: 200, fit: BoxFit.cover),
                    ),
                 SizedBox(
                       height: 10,
                   ),
                   Text(
                       "!Pedido Confirmado!",
                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)
                   ),
                    SizedBox(
                       height: 10,
                   ),
                   Text(
                       "Tu pedido se realizo correctamente!",
                       style: TextStyle(fontSize: 14,color: Colors.white)
                   ),
                    SizedBox(
                       height: 14,
                   ),
                   Text(
                       "Entrega en Hueves 4:00 pm",
                       style: TextStyle(fontSize: 12, color: Colors.white)
                   ),
                   
                    SizedBox(
                       height: 20,
                   ),
                   GestureDetector(
                    onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => DeliveryTrackingView()));

                      },
           
                    
                    child:Text(
                       "Rastrear mi pedido",
                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,color: Colors.white)
                   ),
                   )
                    ]
                
                   
                   
                
                ),
              )
          
        ),
      ),
    );
  }
  
//   goTracking(context) {
//                Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) => DeliveryTrackingView(),
//   ),
// );
//   }


}
