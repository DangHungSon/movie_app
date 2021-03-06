import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/services/api_call.dart';

import 'genre_events.dart';
import 'genre_states.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  ApiClient apiClient = ApiClient();

  MovieBloc() : super(const MovieInit()) {
    on<RequestGetMovieCategories>((event, emit) async {
      await _handleGetCategories(emit);
    });
  }

  _handleGetCategories(Emitter emit) async {
    emit(const MovieLoading());
    try {
      final response = await apiClient.getGenreList();
      emit(MovieLoadSuccess(movieGenre: response));
    } catch (e) {
      emit(MovieLoadError(message: e.toString()));
    }
  }
}

