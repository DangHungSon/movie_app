import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/main_bloc.dart';
import 'package:movie_app/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: MainBloc.allBlocs(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainScreen(),
        ));
  }
}
