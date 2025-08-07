import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wink/core/common/view_models/brand_card_view_model.dart';
import 'package:wink/core/common/view_models/brand_showcase_view_model.dart';
import 'package:wink/core/common/view_models/category_tab_view_model.dart';
import 'package:wink/core/common/view_models/grid_layout_view_model.dart';
import 'package:wink/core/common/widgets/category_tab.dart';
import 'package:wink/core/common/widgets/category_tab2.dart';
import 'package:wink/core/common/widgets/product_shimmer.dart';
import 'package:wink/core/common/widgets/vertical_product_card.dart';
import 'package:wink/core/utils/constants/image_strings.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/core/utils/constants/text_strings.dart';
import 'package:wink/features/auth/presentation/widgets/grid_layout.dart';
import 'package:wink/features/shop/presentation/controller/shop_cubit.dart';



class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
  const List<String> brandIcons = TImages.brandIcons;
  const List<String> topProducts = TImages.topProducts;
  const List<String> products = TImages.productsImages2;
  const List<String> brandTitles = TTexts.vestidoTitles;
  const List<String> categories = TTexts.categories;

    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
          ),
          value: context.read<ShopCubit>().sortBy,
          items: context
              .read<ShopCubit>()
              .sortByList
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          onChanged: (value) => {
            context.read<ShopCubit>().sortBy = value.toString(),
            BlocProvider.of<ShopCubit>(context).getSortedProducts(
              sortBy: value.toString(),
              sortType: "desc",
            )
          },
        ),
        const SizedBox(
          height: 4,
        ),
        BlocBuilder<ShopCubit, ShopState>(builder: (context, state) {
          if (state is ShopSortedProductsLoaded) {
            return GridLayout(
                gridLayoutModel: GridLayoutModel(
              itemCount: state.productsList.length,
              itemBuilder: (context, index) {
                return VerticalProductCard(
                  index: index,
                  product: state.productsList[index],
                );
              },
            ));
          } else if (state is ShopError) {
            return Text(state.error.message);
          }

          return 
          
          //const ProductShimmer();

          CategoryTab2(
                      categoryTabModel: CategoryTabModel(
                        brandShowcaseModel: BrandShowcaseModel(
                          brandCardModel: BrandCardModel(
                            isVerified: true,
                            image: brandIcons[categories.indexOf("Vestidos") %
                                brandIcons.length],
                            brandName: brandTitles[
                                categories.indexOf("Vestidos") %
                                    brandTitles.length],
                            showBorder: false,
                            onTap: () {},
                            productCount: 25,
                          ),
                          topThreeProductsOfBrand: topProducts,
                        ),
                        products: products,
                        categoryTitle: "Vestidos",
                      ),
                    );
        }),
      ],
    );
  }
}
