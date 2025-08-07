import 'package:dartz/dartz.dart';
import 'package:wink/core/utils/exceptions/exceptions.dart';
import 'package:wink/features/shop/domain/entities/product_entity.dart';
import 'package:wink/features/shop/domain/repository/shop_repository.dart';

class GetProductsBySearchUsecase {
  final ShopRepository shopRepository;

  GetProductsBySearchUsecase({required this.shopRepository});

  Future<Either<TExceptions, List<ProductEntity>>> call(
      { String ?search=""}) async {
    return await shopRepository.getProductsBySearch(search: search);
  }
}
