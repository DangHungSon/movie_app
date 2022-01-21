import 'package:equatable/equatable.dart';
import 'package:movie_app/models/banner_model.dart';
import 'package:movie_app/models/movie_genre_model.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object?> get props => [];
}

class MovieInit extends MovieState {
  const MovieInit();
}

class MovieLoading extends MovieState {
  const MovieLoading();
}

class MovieLoadSuccess extends MovieState {
  final MovieGenre? movieGenre;
  const MovieLoadSuccess({this.movieGenre});

  @override
  List<Object?> get props => [movieGenre];
}

class MovieLoadError extends MovieState {
  final String? message;
  const MovieLoadError({this.message});

  @override
  List<Object?> get props => [message];
}

abstract class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object?> get props => [];
}

class BannerInit extends BannerState {
  const BannerInit();
}

class BannerLoading extends BannerState {
  const BannerLoading();
}

class BannerLoadSuccess extends BannerState{
  final Banner? banner;
  const BannerLoadSuccess({this.banner});

  @override
  List<Object?> get props => [banner];
}

class BannerLoadError extends BannerState{
  final String? message;
  const BannerLoadError({this.message});

  @override
  List<Object?> get props => [message];
}