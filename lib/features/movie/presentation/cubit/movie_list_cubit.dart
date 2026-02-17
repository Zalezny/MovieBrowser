import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/features/movie/domain/use_cases/search_movies_use_case.dart';
import 'package:flutter_recruitment_task/features/movie/presentation/cubit/movie_list_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieListCubit extends Cubit<MovieListState> {
  final SearchMoviesUseCase _searchMoviesUseCase;

  MovieListCubit(this._searchMoviesUseCase)
      : super(const MovieListState.initial());

  Future<void> searchMovies(String query) async {
    if (query.isEmpty) {
      emit(const MovieListState.initial());
      return;
    }

    emit(const MovieListState.loading());

    final result = await _searchMoviesUseCase(query);
    result.fold(
      (failure) => emit(MovieListState.failure(failure.message)),
      (movies) => emit(MovieListState.success(movies)),
    );
  }
}
