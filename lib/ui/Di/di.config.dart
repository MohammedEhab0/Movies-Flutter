// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../api/apiManger.dart' as _i3;
import '../../Data/data_sources/remote/auth_remote_data_source.dart' as _i4;
import '../../Data/data_sources/remote/Impl/auth_remote_daraSource_impl.dart'
    as _i5;
import '../../Data/repositories/auth/auth_repository.dart' as _i6;
import '../../Data/repositories/auth/auth_repository_impl.dart' as _i7;
import '../auth/login/Cubit/login_view_model.dart' as _i8;
import '../auth/register/Cubit/register_view_model.dart' as _i9;

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
    gh.singleton<_i3.ApiManger>(() => _i3.ApiManger());
    gh.factory<_i4.AuthRemoteDataSource>(
        () => _i5.AuthRemoteDataSourceImpl(apiManger: gh<_i3.ApiManger>()));
    gh.factory<_i6.AuthRepository>(() => _i7.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i4.AuthRemoteDataSource>()));
    gh.factory<_i8.LoginViewModel>(
        () => _i8.LoginViewModel(authRepository: gh<_i6.AuthRepository>()));
    gh.factory<_i9.RegisterViewModel>(
        () => _i9.RegisterViewModel(authRepository: gh<_i6.AuthRepository>()));
    return this;
  }
}
