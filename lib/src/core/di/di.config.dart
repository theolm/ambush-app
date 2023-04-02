// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:template_flutter/src/features/demo_feature/data/increment_repository.dart'
    as _i3;
import 'package:template_flutter/src/features/demo_feature/domain/increment_use_case.dart'
    as _i4;
import 'package:template_flutter/src/features/demo_feature/presentation/demo_viewmodel.dart'
    as _i5;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.IIncrementRepository>(
      () => _i3.DevIncrementRepository(),
      registerFor: {_dev},
    );
    gh.factory<_i3.IIncrementRepository>(
      () => _i3.ProdIncrementRepository(),
      registerFor: {_prod},
    );
    gh.factory<_i4.IIncrementUseCase>(
        () => _i4.IncrementUseCase(gh<_i3.IIncrementRepository>()));
    gh.factory<_i5.DemoViewModel>(
        () => _i5.DemoViewModel(gh<_i4.IIncrementUseCase>()));
    return this;
  }
}
