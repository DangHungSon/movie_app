import 'package:equatable/equatable.dart';
import 'package:movie_app/models/banner_model.dart';

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
  final MovieBanner? movieBanner;
  const BannerLoadSuccess({this.movieBanner});

  @override
  List<Object?> get props => [movieBanner];
}

class BannerLoadError extends BannerState{
  final String? messageBanner;
  const BannerLoadError({this.messageBanner});

  @override
  List<Object?> get props => [messageBanner];
}