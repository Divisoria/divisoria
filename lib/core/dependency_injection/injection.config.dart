// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i3;
import 'package:http/http.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/product/data/datasources/product_local_data_source.dart'
    as _i9;
import '../../features/product/data/datasources/product_remote_data_source.dart'
    as _i10;
import '../../features/product/data/repositories/products_repository_impl.dart'
    as _i12;
import '../../features/product/domain/entities/product.dart' as _i4;
import '../../features/product/domain/repositories/product_repository.dart'
    as _i11;
import '../../features/product/domain/usecases/fetch_remote_product.dart'
    as _i13;
import '../../features/product/domain/usecases/fetch_remote_products.dart'
    as _i14;
import '../../features/product/presentation/blocs/product/product_bloc.dart'
    as _i15;
import '../../features/product/presentation/blocs/product_info/product_info_fetch_bloc.dart'
    as _i16;
import '../config/config.dart' as _i6;
import '../config/dev.config.dart' as _i7;
import '../config/prod.config.dart' as _i8;
import '../hive/box_module.dart' as _i17;
import '../hive/remote_module.dart' as _i18;

const String _dev = 'dev';
const String _prod = 'prod';

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final boxModule = _$BoxModule();
  final remoteModule = _$RemoteModule();
  await gh.factoryAsync<_i3.Box<_i4.Product>>(
    () => boxModule.recipeSchedule,
    preResolve: true,
  );
  gh.factory<_i5.Client>(() => remoteModule.prefs);
  gh.factory<_i6.Config>(
    () => _i7.DevConfig(),
    registerFor: {_dev},
  );
  gh.factory<_i6.Config>(
    () => _i8.ProdConfig(),
    registerFor: {_prod},
  );
  gh.lazySingleton<_i9.ProductLocalDataSource>(() =>
      _i9.ProductLocalDataSourceImpl(productBox: gh<_i3.Box<_i4.Product>>()));
  gh.lazySingleton<_i10.ProductRemoteDataSource>(
      () => _i10.ProductRemoteDataSourceImpl(
            client: gh<_i5.Client>(),
            config: gh<_i6.Config>(),
          ));
  gh.lazySingleton<_i11.ProductRepository>(() => _i12.ProductRepositoryImpl(
        productLocalDataSource: gh<_i9.ProductLocalDataSource>(),
        productRemoteDataSource: gh<_i10.ProductRemoteDataSource>(),
      ));
  gh.lazySingleton<_i13.FetchRemoteProduct>(
      () => _i13.FetchRemoteProduct(gh<_i11.ProductRepository>()));
  gh.lazySingleton<_i14.FetchRemoteProducts>(
      () => _i14.FetchRemoteProducts(gh<_i11.ProductRepository>()));
  gh.factory<_i15.ProductBloc>(() =>
      _i15.ProductBloc(fetchRemoteProducts: gh<_i14.FetchRemoteProducts>()));
  gh.factory<_i16.ProductInfoFetchBloc>(() => _i16.ProductInfoFetchBloc(
      fetchRemoteProduct: gh<_i13.FetchRemoteProduct>()));
  return getIt;
}

class _$BoxModule extends _i17.BoxModule {}

class _$RemoteModule extends _i18.RemoteModule {}
