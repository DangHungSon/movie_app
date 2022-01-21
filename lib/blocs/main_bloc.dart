import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'banner_bloc/banner_bloc.dart';
import 'genre_bloc/genre_bloc.dart';

class MainBloc {
  static List<BlocProvider> allBlocs() {
    return [
      // Data bloc
      BlocProvider<MovieBloc>(
        create: (BuildContext context) => MovieBloc(),
      ),
      BlocProvider<BannerBloc>(
        create: (BuildContext context) => BannerBloc(),
      ),
      // Theme bloc...
    ];
  }
}