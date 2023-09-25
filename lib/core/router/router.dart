import 'package:divisoria/core/router/routes.dart';
import 'package:divisoria/features/cart/presentation/pages/cart_page.dart';
import 'package:divisoria/features/home/presentation/pages/home_page.dart';
import 'package:divisoria/features/product/presentation/pages/product_page.dart';
import 'package:divisoria/features/sign_in/presentation/pages/sign_in_page.dart';
import 'package:divisoria/features/sign_up/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: MainPages.home.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: MainPages.home.path,
        name: MainPages.home.name,
        builder: (context, state) {
          return HomePage(
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        path: MainPages.signIn.path,
        name: MainPages.signIn.name,
        builder: (context, state) {
          return SignInPage(
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        path: MainPages.signUp.path,
        name: MainPages.signUp.name,
        builder: (context, state) {
          return SignUpPage(
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        path: MainPages.cart.path,
        name: MainPages.cart.name,
        builder: (context, state) {
          return CartPage(
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        path: '${MainPages.product.path}/:id',
        name: MainPages.product.name,
        builder: (context, state) {
          return ProductPage(
            key: state.pageKey,
            id: state.pathParameters["id"],
          );
        },
      ),
    ],
    errorBuilder: (context, state) => const Text("not found"),
  );

  static GoRouter get router => _router;
}
