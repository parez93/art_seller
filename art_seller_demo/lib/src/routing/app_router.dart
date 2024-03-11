import 'package:art_seller_demo/src/common_widgets/not_implemented_screen.dart';
import 'package:art_seller_demo/src/features/products/presentation/product_screen/product_screen.dart';
import 'package:art_seller_demo/src/features/products/presentation/products_list/products_list_screen.dart';
import 'package:art_seller_demo/src/routing/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { home, product, error , notImplemented}

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (BuildContext context, GoRouterState state) =>
          ProductsListScreen(),
      routes: <RouteBase>[
        GoRoute(
          path: 'product/:id',
          name: AppRoute.product.name,
          // builder: (BuildContext context, GoRouterState state) {
          //   final productId = state.pathParameters['id']!;
          //   return ProductScreen(productId: productId);
          // },
          pageBuilder: (context, state) {
            final productId = state.pathParameters['id']!;
            return CustomTransitionPage<void>(
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
              child: ProductScreen(productId: productId),
            );
          },
        ),
        GoRoute(
          path: 'not-implemented',
          name: AppRoute.notImplemented.name,
          builder: (BuildContext context, GoRouterState state) {
            return NotImplementedScreen();
          },
        )
      ],
    ),
  ],
);
