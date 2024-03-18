import 'dart:async';

import 'package:art_seller_demo/src/constants/test_products.dart';
import 'package:art_seller_demo/src/features/products/data/product_repository.dart';
import 'package:art_seller_demo/src/features/products/domain/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeProductRepository implements ProductRepository {

  @override
  Future<List<Product>> fetchGetProductList() {
    return Future.delayed(Durations.extralong4 * 2,
        () => Future.value(kTestProducts.sublist(0, 5) as List<Product>));
  }

  @override
  Future<List<Product>> fetchGetNewArrivalsProductList() {
    return Future.delayed(Durations.extralong4 * 2,
            () => Future.value(kTestProducts.sublist(6, 9) as List<Product>));
  }

  @override
  Future<Product> fetchGetProduct(ProductID id) {
    return Future.delayed(
        Durations.extralong4 * 2,
        () => Future.value(
            kTestProducts.firstWhere((p) => p.id == id) as Product));
  }
}

final productRepositoryProvider = Provider<FakeProductRepository>((ref) {
  return FakeProductRepository();
});

final productListFutureProvider =
    FutureProvider.autoDispose<List<Product>>((ref) {
  final productRepository = ref.watch(productRepositoryProvider);
  return productRepository.fetchGetProductList();
});

final productFutureProvider =
    FutureProvider.family.autoDispose<Product, ProductID>((ref, id) {
  final productRepository = ref.watch(productRepositoryProvider);
  return productRepository.fetchGetProduct(id);
});

final newArrivalProductListFutureProvider =
FutureProvider.autoDispose<List<Product>>((ref) {
  final productRepository = ref.watch(productRepositoryProvider);
  return productRepository.fetchGetNewArrivalsProductList();
});
