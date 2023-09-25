class PageInfo {
  const PageInfo({
    required this.name,
    required this.mainDirectory,
  });

  final String name;
  final String mainDirectory;
}

enum MainPages {
  home,
  signIn,
  signUp,
  cart,
  product,
  error,
}

const home = PageInfo(
  name: 'Home Page',
  mainDirectory: '',
);

const signIn = PageInfo(
  name: 'Sign In Page',
  mainDirectory: 'sign-in',
);

const signUp = PageInfo(
  name: 'Sign Up Page',
  mainDirectory: 'sign-up',
);

const cart = PageInfo(
  name: 'Cart Page',
  mainDirectory: 'cart',
);

const product = PageInfo(
  name: 'Product Page',
  mainDirectory: 'product',
);

const error = PageInfo(
  name: 'Error Page',
  mainDirectory: 'error',
);

extension MainPagesExtension on MainPages {
  String get directory {
    switch (this) {
      case MainPages.home:
        return home.mainDirectory;
      case MainPages.signIn:
        return signIn.mainDirectory;
      case MainPages.signUp:
        return signUp.mainDirectory;
      case MainPages.cart:
        return cart.mainDirectory;
      case MainPages.product:
        return product.mainDirectory;
      case MainPages.error:
        return error.mainDirectory;
    }
  }

  String get path {
    switch (this) {
      case MainPages.home:
        return '/${home.mainDirectory}';
      case MainPages.signIn:
        return '/${signIn.mainDirectory}';
      case MainPages.signUp:
        return '/${signUp.mainDirectory}';
      case MainPages.cart:
        return '/${cart.mainDirectory}';
      case MainPages.product:
        return '/${product.mainDirectory}';
      case MainPages.error:
        return '/${error.mainDirectory}';
    }
  }

  String get name {
    switch (this) {
      case MainPages.home:
        return home.name;
      case MainPages.signIn:
        return signIn.name;
      case MainPages.signUp:
        return signUp.name;
      case MainPages.cart:
        return cart.name;
      case MainPages.product:
        return product.name;
      case MainPages.error:
        return error.name;
    }
  }
}
