import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/features/movie/domain/use_cases/get_movie_details_use_case.dart';
import 'package:flutter_recruitment_task/features/movie/presentation/cubit/movie_details_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;

  MovieDetailsCubit(this._getMovieDetailsUseCase) : super(const MovieDetailsState.initial());

  Future<void> getMovieDetails(int movieId) async {
    emit(const MovieDetailsState.loading());
    final result = await _getMovieDetailsUseCase(movieId);
    result.fold(
      (failure) => emit(MovieDetailsState.failure(failure.message)),
      (movieDetails) => emit(MovieDetailsState.success(movieDetails)),
    );
  }
}
