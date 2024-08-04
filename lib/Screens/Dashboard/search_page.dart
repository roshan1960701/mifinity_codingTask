import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mifinity_task/Colors/colors.dart';
import 'package:mifinity_task/Utility/utility.dart';
import 'package:get/get.dart';
import 'package:mifinity_task/Screens/Dashboard/dashboard_controller.dart';
import 'package:mifinity_task/Storage/storage.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final dashboardController = Get.find<DashboardController>();

  @override
  initState() {
    super.initState();
  }

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
        onFieldSubmitted:(value){
          dashboardController.getMoviesByQuery(value);
        },

        decoration: InputDecoration(
          hintText: 'What do you want to Watch?',
          enabled: true,
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
          prefixIcon: Icon(Icons.search_rounded,color: Colors.white,),
          suffixIcon: IconButton(onPressed: (){
            dashboardController.searchController.clear();
          }, icon: Icon(Icons.close,color: Colors.white,),),
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

  Widget movieTiles(src,movieName){
    return paddingAll(0.0, 15.0, 0.0, 0.0, Container(
      width: getWidth(context),
      height: getHeight(context) * 0.08,
      // color: Colors.yellowAccent,
      child: Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: getWidth(context) * 0.12,
              height: getHeight(context) * 0.08,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child:SizedBox.fromSize(
                    child: Image.network(src,
                      fit: BoxFit.fill,
                    ),
                  )
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: paddingAll(0.0, 0.0, getWidth(context) * 0.04, 0.0, SizedBox(
                  width: getWidth(context) * 0.7,
                  child: Text(movieName,
                  style: TextStyle(
                    overflow:TextOverflow.ellipsis,
                    color: Colors.white,
                    fontSize: getFontSize(context, 16),
                    fontWeight: FontWeight.w500,
                  )))
                ,)),
        ],
      ),
    ));
  }

  Widget searchList(){
    return Obx(()=> Container(
      width: getWidth(context),
      height: getHeight(context) * 0.1 * dashboardController.filteredMovies.length,
      child: ListView.builder(
          itemCount: dashboardController.filteredMovies.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext,index){
            int reversedIndex = dashboardController.filteredMovies.length - 1 - index;
            return movieTiles(dashboardController.filteredMovies[reversedIndex]['image'],dashboardController.filteredMovies[reversedIndex]['title']);
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
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
                paddingAll(20.0, 0.0, 10.0, 10.0, searchBar(context),),
                paddingAll(20.0, 0.0, 10.0, 10.0, searchList(),),
                SizedBox(height: 40.0,),

              ],
            )
        ),
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    dashboardController.searchController.clear();
  }
}
