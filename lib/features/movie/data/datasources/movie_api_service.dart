import 'package:dio/dio.dart';
import 'package:flutter_recruitment_task/features/movie/data/models/movie_details_dto.dart';
import 'package:flutter_recruitment_task/features/movie/data/models/movie_list_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/movie_api_service.g.dart';

@RestApi()
abstract class MovieApiService {
  factory MovieApiService(Dio dio) = _MovieApiService;

  @GET('/3/search/movie')
  Future<MovieListDto> searchMovies(
    @Query('api_key') String apiKey,
    @Query('query') String query,
  );

  @GET('/3/movie/{id}')
  Future<MovieDetailsDto> getMovieDetails(
    @Path('id') int id,
    @Query('api_key') String apiKey,
  );
}