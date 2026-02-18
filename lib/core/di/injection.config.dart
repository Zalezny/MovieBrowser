// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_recruitment_task/core/config/app_config.dart' as _i458;
import 'package:flutter_recruitment_task/core/di/modules/network_module.dart'
    as _i649;
import 'package:flutter_recruitment_task/features/movie/data/datasources/movie_api_service.dart'
    as _i800;
import 'package:flutter_recruitment_task/features/movie/data/repositories/movie_repository_impl.dart'
    as _i131;
import 'package:flutter_recruitment_task/features/movie/domain/repositories/movie_repository.dart'
    as _i732;
import 'package:flutter_recruitment_task/features/movie/domain/use_cases/get_movie_details_use_case.dart'
    as _i913;
import 'package:flutter_recruitment_task/features/movie/domain/use_cases/search_movies_use_case.dart'
    as _i0;
import 'package:flutter_recruitment_task/features/movie/presentation/cubit/movie_details_cubit.dart'
    as _i81;
import 'package:flutter_recruitment_task/features/movie/presentation/cubit/movie_list_cubit.dart'
    as _i407;
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
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i458.AppConfig>(() => networkModule.appConfig);
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio(gh<_i458.AppConfig>()));
    gh.lazySingleton<_i800.MovieApiService>(
        () => networkModule.movieApiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i732.MovieRepository>(() => _i131.MovieRepositoryImpl(
          gh<_i800.MovieApiService>(),
          gh<_i458.AppConfig>(),
        ));
    gh.factory<_i913.GetMovieDetailsUseCase>(
        () => _i913.GetMovieDetailsUseCase(gh<_i732.MovieRepository>()));
    gh.factory<_i0.SearchMoviesUseCase>(
        () => _i0.SearchMoviesUseCase(gh<_i732.MovieRepository>()));
    gh.factory<_i407.MovieListCubit>(
        () => _i407.MovieListCubit(gh<_i0.SearchMoviesUseCase>()));
    gh.factory<_i81.MovieDetailsCubit>(
        () => _i81.MovieDetailsCubit(gh<_i913.GetMovieDetailsUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i649.NetworkModule {}
