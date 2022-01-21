import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object?> get props => [];
}

class RequestGetMovieCategories extends MovieEvent {
  const RequestGetMovieCategories();

  @override
  List<Object?> get props => [];
}

abstract class BannerEvent extends Equatable{
  const BannerEvent();

  @override
  List<Object?> get props => [];
}

class RequestGetBanner extends BannerEvent{
  const RequestGetBanner();

  @override
  List<Object?> get props => [];
}
