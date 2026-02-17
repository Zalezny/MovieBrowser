import 'package:dio/dio.dart';
import 'package:flutter_recruitment_task/features/movie/data/models/movie_list_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/movie_api_client.g.dart';

@RestApi()
abstract class MovieApiClient {
  factory MovieApiClient(Dio dio, {String baseUrl}) = _MovieApiClient;

  @GET('/3/search/movie')
  Future<MovieListDto> searchMovies(
    @Query('api_key') String apiKey,
    @Query('query') String query,
  );
}
