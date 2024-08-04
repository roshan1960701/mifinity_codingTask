import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get_storage/get_storage.dart';

Future<void> saveData() async {
  final jsonString = await rootBundle.loadString('assets/data.json');
  final jsonResponse = json.decode(jsonString);
  final box = await GetStorage();
  box.write('dashBoardData', jsonResponse);
}


Future<dynamic> fetchDashboardData() async {
  final box = await GetStorage();
  final response = await box.read('dashBoardData');
  return response;
}

Future<void> saveSearchData(data)async{
  final box = await GetStorage();
  List<dynamic> searchList = box.read<List<dynamic>>('searchData') ?? [];
  searchList.add(data);
  box.write('searchData', searchList);
}

Future<List<dynamic>> retrieveSearchData()async{
  final box = await GetStorage();
  final searchList = await box.read('searchData');
  return searchList;
}

