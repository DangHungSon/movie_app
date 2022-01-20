import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/movie_bloc/movie_bloc.dart';
import 'package:movie_app/blocs/movie_bloc/movie_states.dart';

class MainBloc {
  static List<BlocProvider> allBlocs() {
    return [
      // Data bloc
      BlocProvider<MovieBloc>(
        create: (BuildContext context) => MovieBloc(),
      ),
      // Theme bloc...
    ];
  }
}