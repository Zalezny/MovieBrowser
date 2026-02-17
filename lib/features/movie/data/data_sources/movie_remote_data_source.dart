import 'package:flutter_recruitment_task/core/network/movie_api_client.dart';
import 'package:flutter_recruitment_task/features/movie/data/models/movie_list_dto.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieRemoteDataSource {
  static const _apiKey = '052afdb6e0ab9af424e3f3c8edbb33fb';

  final MovieApiClient _apiClient;

  MovieRemoteDataSource(this._apiClient);

  Future<MovieListDto> searchMovies(String query) =>
      _apiClient.searchMovies(_apiKey, query);
}
