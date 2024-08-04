import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mifinity_task/Colors/colors.dart';
import 'package:mifinity_task/Utility/utility.dart';
import 'package:get/get.dart';
import 'package:mifinity_task/Screens/Dashboard/dashboard_controller.dart';
import 'dart:math';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final dashboardController = Get.find<DashboardController>();
  late final generatedColor;


  @override
  initState(){
    super.initState();
    generatedColor = generateUniqueColors(dashboardController.genreNames.length);

    print(dashboardController.moviesDataList.firstWhere((category) => category['category'] == 'Popular on Hotstar')['movies']);



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
        style: TextStyle(
          fontSize: getFontSize(context, 16),
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
        /*onSaved: (value){
          dashboardController.searchText.value = value!;
          print(dashboardController.searchText.value);
        },*/
        onChanged: (value){
          dashboardController.searchText.value = value!;


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

  Widget categoryTiles(colorName,categoryName,src){
    return paddingAll(0.0, 0.0, 0.0, 0.0, Container(
      decoration: BoxDecoration(
        color: colorName,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Stack(
        clipBehavior:Clip.hardEdge,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: paddingAll(0.0, 0.0, 10.0, 0.0, Text(categoryName,style: TextStyle(
              color: Colors.white,
              fontSize: getFontSize(context, 15),
              fontWeight: FontWeight.w700,
            ))),
          ),
          Positioned(
            top: -15,
            right: -20,
              bottom: -15,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(src),
                ),
              )
          )
        ],
      ),

    ));
  }

  Widget browseGenre(){
    return Container(
      width: getWidth(context),
      height: getHeight(context) * 0.055    * dashboardController.genreNames.length,

      child: GridView.builder(
        itemCount: dashboardController.genreNames.length,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing:25.0,
            mainAxisSpacing: 25.0,
            childAspectRatio: 1.0,
            mainAxisExtent: 80.0,
          ),
          itemBuilder: (BuildContext,index){
            final colorName = generatedColor[index];
        return categoryTiles(colorName,dashboardController.genreNames[index]['genre'],dashboardController.genreNames[index]['image'],);
      }),

    );

  }

  Widget movieTiles(src,movieName){
    return paddingAll(0.0, 15.0, 0.0, 0.0, Container(
      width: getWidth(context),
      height: getHeight(context) * 0.08,
      // color: Colors.yellowAccent,
      child: Stack(
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
            child: paddingAll(0.0, 0.0, getWidth(context) * 0.15, 0.0, Text(movieName,style: TextStyle(
              color: Colors.white,
              fontSize: getFontSize(context, 16),
              fontWeight: FontWeight.w500,
            )),)),
          Align(
            alignment: Alignment.bottomCenter,
            child: paddingAll(getHeight(context) * 0.085, 0.0, getWidth(context) * 0.15, 0.0, Divider(
              color: Colors.white.withOpacity(0.2),),
            ),)
        ],
      ),
    ));
  }

  Widget popularMoviesList(){
    return Container(
      width: getWidth(context),
      height: getHeight(context) * 0.1 * dashboardController.moviesDataList.firstWhere((category) => category['category'] == 'Popular on Hotstar')['movies'].length,
      child: ListView.builder(
          itemCount: dashboardController.moviesDataList.firstWhere((category) => category['category'] == 'Popular on Hotstar')['movies'].length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext,index){
        return movieTiles(dashboardController.moviesDataList.firstWhere((category) => category['category'] == 'Popular on Hotstar')['movies'][index]['image'],
            dashboardController.moviesDataList.firstWhere((category) => category['category'] == 'Popular on Hotstar')['movies'][index]['title']);
      }),

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
                paddingAll(20.0, 0.0, 10.0, 10.0, searchBar(context),),
                paddingAll(10.0, 0.0, 10.0, 10.0, Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Genre",style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: getFontSize(context, 16),
                      fontWeight: FontWeight.w400,
                    )),
                    Text("View All",style: TextStyle(
                      color: Colors.white,
                      fontSize: getFontSize(context, 16),
                      fontWeight: FontWeight.w400,
                    ))
                  ],
                ),),
                paddingAll(5.0, 0.0, 10.0, 10.0, browseGenre()),

                Align(
                  alignment: Alignment.centerLeft,
                  child: paddingAll(10.0, 0.0, 10.0, 0.0, Text("Popular Movies",style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: getFontSize(context, 16),
                    fontWeight: FontWeight.w400,
                  )),)),
                paddingAll(5.0, 0.0, 10.0, 10.0, popularMoviesList(),),

              ],
            )
        ),
      ),
    );
  }

  List<Color> generateUniqueColors(int count) {
    final colors = List.of(Colors.primaries);
    final random = Random();

    if (count > colors.length) {
      throw ArgumentError('Requested more unique colors than available');
    }

    // Shuffle the colors and take the required number of unique colors
    colors.shuffle(random);
    return colors.take(count).toList();
  }
}
