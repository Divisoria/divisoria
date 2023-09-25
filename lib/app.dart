import 'package:divisoria/core/dependency_injection/injection.dart';
import 'package:divisoria/core/router/router.dart';
import 'package:divisoria/features/product/presentation/blocs/product/product_bloc.dart';
import 'package:divisoria/features/product/presentation/blocs/product_info/product_info_fetch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ProductBloc>()),
        BlocProvider(create: (_) => getIt<ProductInfoFetchBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Divisoria',
        debugShowCheckedModeBanner: false,
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
      ),
    );
  }
}
