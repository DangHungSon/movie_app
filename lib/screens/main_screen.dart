import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/movie_bloc/movie_bloc.dart';
import 'package:movie_app/blocs/movie_bloc/movie_events.dart';
import 'package:movie_app/blocs/movie_bloc/movie_states.dart';
import 'package:movie_app/models/movie_genre_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late final TabController _tabController;

  // Categories
  List<Genres> _genres = [];

  // Request call categories
  _requestCategories() async {
    BlocProvider.of<MovieBloc>(context).add(const RequestGetMovieCategories());
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    // Request data movie's categories
    _requestCategories();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieBloc, MovieState>(
        builder: (context, state) => _buildUI(context),
        listener: (context, state) {
          if (state is MovieLoading) {
            print('loading...');
          } else if (state is MovieLoadSuccess) {
            print('Success...');
            _genres = state.movieGenre?.genres ?? [];
          } else if (state is MovieLoadError) {
            print('message Error: ${state.message}');
          }
        });
  }

  // Build main UI
  _buildUI(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _customAppBar(context),
          _movieStatus(context),
          _movieGenre(context),
        ],
      ),
    );
  }

  //Custom app bar
  Widget _customAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.black,
          )
        ],
      ),
    );
  }

  //Movie Status
  Widget _movieStatus(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TabBar(
        controller: _tabController,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 5,
        indicatorColor: const Color(0xffFE6D8E),
        isScrollable: true,
        tabs: const [
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              'In Theater',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              'Box Office',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              'Coming Soon',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }

  //Movie Genre
  Widget _movieGenre(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _genres.length,
          itemBuilder: (context, index) {
            final item = _genres[index];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(item.name ?? ''),
                ),
              ),
            );
          }),
    );
  }
}
