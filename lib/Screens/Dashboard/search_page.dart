import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mifinity_task/Colors/colors.dart';
import 'package:mifinity_task/Utility/utility.dart';
import 'package:get/get.dart';
import 'package:mifinity_task/Screens/Dashboard/dashboard_controller.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final dashboardController = Get.find<DashboardController>();

  Widget searchBar(context){
    return Container(
      width: getWidth(context),
      decoration: BoxDecoration(
        // color: Colors.deepOrange,
        // color: Colors.white.withOpacity(0.1),
      ),
      child: TextFormField(
        cursorColor: primaryColor,
        keyboardType: TextInputType.text,
        controller: dashboardController.searchController,
        minLines: 1,
        textInputAction: TextInputAction.search,
        style: TextStyle(
          fontSize: getFontSize(context, 16),
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
        onChanged: (value){
          // dashboardController.searchText.value = value;
          // print(dashboardController.searchText.value);
          dashboardController.getMoviesByQuery(value);
        },

        decoration: InputDecoration(
          hintText: 'What do you want to Watch?',
          enabled: true,
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
          prefixIcon: Icon(Icons.search_rounded,color: Colors.white,),
          suffixIcon: Icon(Icons.mic,color: Colors.white,),
          hintStyle: TextStyle(
            fontSize: getFontSize(context, 16),
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.w300,
          ),
          contentPadding:  EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
          border:  OutlineInputBorder(
              borderRadius:  BorderRadius.all(Radius.circular(6.0,),),
              borderSide: BorderSide(color: bgColor.withOpacity(0.5),width: 1)
          ),
          enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(color: bgColor.withOpacity(0.5),width: 1),
          ),
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(color: bgColor.withOpacity(0.5),width: 1),
          ),
          errorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(color: bgColor.withOpacity(0.5),width: 1),
          ),
          focusedErrorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(color: bgColor.withOpacity(0.5),width: 1),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      body: Container(
        width: getWidth(context),
        height: getHeight(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [bgColor,bgColorSecond],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0,0.9]
          ),
        ),
        child: SingleChildScrollView(
            child: Column(
              children: [

              ],
            )
        ),
      ),
    );
  }
}
