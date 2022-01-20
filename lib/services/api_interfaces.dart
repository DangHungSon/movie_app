import 'package:movie_app/models/movie_genre_model.dart';

abstract class ApiInterface {
  Future<MovieGenre> getGenreList();
}