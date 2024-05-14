import 'package:flutter/material.dart';
import 'package:flutter_app/app/networking/api_service.dart';
import 'package:flutter_app/app/networking/movie_now_playing_api.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({super.key});

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  late MovieNowPlayingApi movieNowPlayingApi;
  List<dynamic> movies = [];
  @override
  void initState() {
    super.initState();
    movieNowPlayingApi = MovieNowPlayingApi(ApiService());
    fetchMovies();
  }

  Future fetchMovies() async {
    try {
      var res = await movieNowPlayingApi.fetchNowPlayingMovies();
      if (res != null && res.containsKey('results')) {
        movies = res['results'];
        print('Movies::: $movies');
      } else {
        print('No results found');
      }
    } catch (e) {
      print('Lỗi: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}