import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mifinity_task/Storage/storage.dart';
import 'dart:convert';
import 'package:mifinity_task/Storage/movies_model.dart';

class DashboardController extends GetxService{


  var navBarSelectedIndex = 0.obs;
  var bannerList = [].obs;
  var productionList = [].obs;
  var moviesDataList  = [].obs;
  TextEditingController searchController = TextEditingController();
  var searchText = ''.obs;
  var filteredMovies = [].obs;
  List<Map<String,String>> genreNames = [
    {'genre':'Action','image':'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_.jpg'},
    {'genre':'Drama','image':'https://mediaproxy.tvtropes.org/width/1200/https://static.tvtropes.org/pmwiki/pub/images/simpsons_movie.jpg'},
    {'genre':'Horror','image':'https://upload.wikimedia.org/wikipedia/en/f/f4/Prey_2022_poster.png'},
    {'genre':'Suspense','image':'https://m.media-amazon.com/images/M/MV5BMTk3OTcxMTEyNl5BMl5BanBnXkFtZTcwMDQ4MjQ2OQ@@._V1_.jpg'},];

  PageController pageController = PageController(
     initialPage: 0,
    keepPage: false,
  );



  @override
  void onInit()async {
    super.onInit();
    // print(bannerList);
  }


  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchHomeData() async{
    final response = await fetchDashboardData();
    bannerList.addAll(response['banners']);
    productionList.addAll(response['productionHouse']);
    moviesDataList.addAll(response['moviesCollection']);
    // final results = getMoviesByQuery('Sports');
    // String query = "aven";
    // final results = getMoviesByQuery(query, movieCategories);
  }

   getMoviesByQuery(String query) {
    for (var category in moviesDataList) {
      for (var movie in category['movies']) {
        // if (movie['title'].toLowerCase().contains(query.toLowerCase())) {
        //   matchedMovies.add(movie);
        // }

        // Check if the movie title contains the query
        bool titleMatches = movie['title'].toLowerCase().contains(query.toLowerCase());

        // Check if any genre in the movie's genre list contains the query
        bool genreMatches = movie['genre'].any((genre) => (genre as String).toLowerCase().contains(query.toLowerCase()));

        // If either condition is true, add the movie to the matchedMovies list
        if (titleMatches || genreMatches) {
          filteredMovies.add(movie);
        }
      }
    }
    print(filteredMovies);
  }

}