import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/movie_bloc/movie_events.dart';
import 'package:movie_app/blocs/movie_bloc/movie_states.dart';
import 'package:movie_app/services/api_call.dart';

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

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  ApiClient apiClient = ApiClient();

  BannerBloc() : super(const BannerInit()) {
    on<RequestGetBanner>((event, emit) async {
      await _handleGetBanner(emit);
    });
  }

  _handleGetBanner(Emitter emit) async {
    emit(const BannerLoading());
    try {
      final response = await apiClient.getBannerList();
      emit(BannerLoadSuccess(banner: response));
    } catch (e) {
      emit(BannerLoadError(message: e.toString()));
    }
  }
}
