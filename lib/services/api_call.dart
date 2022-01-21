import 'dart:convert';

import 'package:movie_app/models/movie_genre_model.dart';
import 'package:movie_app/models/banner_model.dart';
import 'package:movie_app/services/api_constants.dart';
import 'package:movie_app/services/api_interfaces.dart';
import 'package:http/http.dart' as http;

class ApiClient extends ApiInterface{

  @override
  Future<MovieGenre> getGenreList() async {
    final response = await http.get(Uri.parse(baseUrl + categoryUrl + '?api_key=$apiKey' + '&language=en-US'));
    if (response.statusCode == 200) {
      return MovieGenre.fromJson(json.decode(response.body));
    } else {
      var message = response.body;
      print(message);
      return throw Exception('Error: Service Not Available. Please try later');
    }
  }

  @override
  Future<MovieBanner> getBannerList() async {
    final response = await http.get(Uri.parse(baseUrl + suggestListUrl + '?api_key=$apiKey' + '&language=en-US' + '&' + page));
    if (response.statusCode == 200) {
      return MovieBanner.fromJson(json.decode(response.body));
    } else {
      var message = response.body;
      print(message);
      return throw Exception('Error: Service Not Available. Please try later');
    }
  }

}