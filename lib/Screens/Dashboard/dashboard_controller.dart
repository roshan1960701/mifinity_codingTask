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
  var dataLoading = false.obs;
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
    dataLoading.value = true;
  }

}