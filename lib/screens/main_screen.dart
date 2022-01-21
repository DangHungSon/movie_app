import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/banner_bloc/banner_bloc.dart';
import 'package:movie_app/blocs/banner_bloc/banner_events.dart';
import 'package:movie_app/blocs/banner_bloc/banner_states.dart';
import 'package:movie_app/blocs/genre_bloc/genre_bloc.dart';
import 'package:movie_app/blocs/genre_bloc/genre_events.dart';
import 'package:movie_app/blocs/genre_bloc/genre_states.dart';
import 'package:movie_app/models/banner_model.dart';
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

  //Banner Movie
  List<Results> _banner = [];

  // Request call categories
  _requestCategories() async {
    BlocProvider.of<MovieBloc>(context).add(const RequestGetMovieCategories());
  }

  // Request banner
  _requestBanner() async {
    BlocProvider.of<BannerBloc>(context).add(const RequestGetBanner());
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    // Request data movie's categories
    _requestCategories();
    _requestBanner();
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _customAppBar(context),
              _movieStatus(context),
              _movieGenre(context),
              BlocConsumer<BannerBloc, BannerState>(
                  builder: (context, state) => _bannerList(context),
                  listener: (context, state) {
                    if (state is BannerLoading) {
                      print('dang load');
                    } else if (state is BannerLoadSuccess) {
                      print('thanh cong');
                      _banner = state.movieBanner?.results ?? [];
                    } else if (state is BannerLoadError) {
                      print('message Error: ${state.messageBanner}');
                    }
                  }),
            ],
          ),
        ),
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
      height: 65,
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

  //Banner List
  Widget _bannerList(BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
            enlargeCenterPage: true,
            enableInfiniteScroll: false),
        itemCount: _banner.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          final banner = _banner[itemIndex];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network('https://www.themoviedb.org/t/p/w600_and_h900_bestv2/${banner.posterPath}',
                fit: BoxFit.cover,),
              ),
            ),
          );
        }
        );
  }
}
