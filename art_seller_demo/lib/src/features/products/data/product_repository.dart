import 'package:art_seller_demo/src/features/products/domain/product.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchGetProductList();

  Future<List<Product>> fetchGetNewArrivalsProductList();

  Future<Product> fetchGetProduct(ProductID id);
}
