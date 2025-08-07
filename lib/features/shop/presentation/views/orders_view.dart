import 'package:flutter/material.dart';
import 'package:wink/core/common/view_models/app_bar_view_model.dart';
import 'package:wink/core/common/widgets/app_bar.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/features/shop/presentation/widgets/orders_list.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarModel: AppBarModel(
            title: Text(
          "My Orders",
          style: Theme.of(context).textTheme.headlineSmall,
        )),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: OrdersList(),
      ),
    );
  }
}
