// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_recruitment_task/core/di/modules/dio_module.dart'
    as _i912;
import 'package:flutter_recruitment_task/core/network/movie_api_client.dart'
    as _i685;
import 'package:flutter_recruitment_task/features/movie/data/data_sources/movie_remote_data_source.dart'
    as _i425;
import 'package:flutter_recruitment_task/features/movie/data/repositories/movie_repository_impl.dart'
    as _i131;
import 'package:flutter_recruitment_task/features/movie/domain/repositories/movie_repository.dart'
    as _i732;
import 'package:flutter_recruitment_task/features/movie/domain/use_cases/search_movies_use_case.dart'
    as _i0;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.singleton<_i685.MovieApiClient>(
        () => dioModule.movieApiClient(gh<_i361.Dio>()));
    gh.factory<_i425.MovieRemoteDataSource>(
        () => _i425.MovieRemoteDataSource(gh<_i685.MovieApiClient>()));
    gh.lazySingleton<_i732.MovieRepository>(
        () => _i131.MovieRepositoryImpl(gh<_i425.MovieRemoteDataSource>()));
    gh.factory<_i0.SearchMoviesUseCase>(
        () => _i0.SearchMoviesUseCase(gh<_i732.MovieRepository>()));
    return this;
  }
}

class _$DioModule extends _i912.DioModule {}
