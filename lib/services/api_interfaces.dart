import 'package:movie_app/models/movie_genre_model.dart';
import 'package:movie_app/models/banner_model.dart';

abstract class ApiInterface {
  Future<MovieGenre> getGenreList();
  Future<MovieBanner> getBannerList();
}