import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mifinity_task/Storage/storage.dart';
import 'package:mifinity_task/Storage/dashboard_model.dart';
import 'dart:convert';

class DashboardController extends GetxService{


  var navBarSelectedIndex = 0.obs;
  var bannerList = [].obs;
  var productionList = [].obs;
  var moviesDataList  = [].obs;
  TextEditingController searchController = TextEditingController();
  var searchText = ''.obs;
  var moviesCategories = [].obs;
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
    // moviesCategories.addAll(moviesDataList['category']);
    //searchMoviesData = extractMovies(moviesCategories);
  }

  // Future<void> extractMovies(moviesCategories) {
  //   return moviesCategories.expand((c) => c['movies']).toList();
  // }

  // Future<void> searchMoviesData(query)async{
  //   filteredMovies = extractMovies(moviesCategories).where((movie) {
  //     return movie['title'].toLowerCase().contains(query.toLowerCase());
  //   }).toList();
  //
  //   print(filteredMovies);
  //
  // }

}