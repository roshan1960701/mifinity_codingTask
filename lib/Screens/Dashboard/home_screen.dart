import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mifinity_task/Colors/colors.dart';
import 'package:mifinity_task/Utility/utility.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mifinity_task/Screens/Dashboard/dashboard_controller.dart';
import 'package:get/get.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final dashboardController = Get.find<DashboardController>();
  final CarouselController _controller = CarouselController();



  Widget logoDisplay(){
    return Container(
      height: getHeight(context) * 0.09,
      width: getWidth(context) * 0.20,
      // color: Colors.red,
      child: Image.asset('assets/disney-hotstar-logo.png', fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget bannerSlider(){
    return paddingAll(0.0,0.0, 0.0,0.0,Obx(()=>
        Container(
          height: getHeight(context)* 0.25,
          width: getWidth(context),
          decoration: BoxDecoration(
            // color: Colors.yellow,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: bgColor.withOpacity(0.5),
                  blurRadius: 6.0,
                  spreadRadius: 1.0,
                  offset: const Offset(0,3),
                )
              ]
          ),
          // color: Colors.yellow,
          child:CarouselSlider(
            options: CarouselOptions(
              autoPlayCurve: Curves.fastOutSlowIn,
              aspectRatio: 18/9,
              viewportFraction: 0.92,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              padEnds: true,
            ),
            carouselController: _controller,
            items: dashboardController.bannerList.map((element){
              return Container(
                // color: Colors.deepOrange,
                height: getHeight(context)* 0.25,
                width: getWidth(context) * 0.90,
                padding: EdgeInsets.only(left: 2.0,right: 2.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child:SizedBox.fromSize(
                      child: Image.network(element['image'],
                        fit: BoxFit.fill,
                      ),
                    )
                ),
              );
            }).toList(),
          )
          ),
        )
    );

  }

  Widget productionTiles(src){
    return Container(
      width: getWidth(context) * 0.2,
      decoration: BoxDecoration(
        // color: bgColor,
        border: Border.all(color: labelTextColor.withOpacity(0.5),width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        gradient: LinearGradient(colors: [bgColorSecond,bgColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0,0.9]
        ),
      ),
      child: Image.network(src,fit: BoxFit.contain,),
    );
  }

  Widget productionSlider(){
    return Obx(()=> Container(
      width: getWidth(context),
      height: getHeight(context) * 0.07,
      // color: Colors.red,
      child: ListView.builder(
          itemCount: dashboardController.productionList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext,index){
            return paddingAll(0.0, 0.0, 0.0,10.0, productionTiles(dashboardController.productionList[index]['image']));

          }),

    ));
  }

  Widget moviesListView(moviesList,categoryName){
    return Container(
      width: getWidth(context),
      height: getHeight(context) * 0.25,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          paddingAll(0.0, 5.0, 0.0, 0.0, Align(
            alignment: Alignment.topLeft,
            child: Text(categoryName,style: TextStyle(
              color: labelTextColor,
              fontSize: getFontSize(context, 16),
              fontWeight: FontWeight.w400,
            )),)
          ),
          Container(
            width: getWidth(context),
            height: getHeight(context) * 0.2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: moviesList['movies'].length,
                itemBuilder: (BuildContext,index){
                  return Container(
                    // color: Colors.blue,
                    width: getWidth(context) * 0.3,
                    padding: EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      // color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: bgColor.withOpacity(0.2),
                            blurRadius: 7.0,
                            spreadRadius: 1.0,
                            offset: const Offset(2,2),
                          )
                        ]
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child:SizedBox.fromSize(
                        child: Image.network(moviesList['movies'][index]['image'],
                          fit: BoxFit.fill,
                        ),
                      )
                  ),

                  );
                })
          ),
        ],
      ),
    );
  }

  Widget moviesCollectionView(){
    return Obx(()=> Container(
      width: getWidth(context),
      height: getHeight(context) * 0.30 * dashboardController.moviesDataList.length,
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: dashboardController.moviesDataList.length,
          itemBuilder: (BuildContext,index){
            return moviesListView(dashboardController.moviesDataList[index],dashboardController.moviesDataList[index]['category']);
          }),
    ));

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
                paddingAll(0.0, 0.0, 0.0, 0.0, logoDisplay(),),
                paddingAll(10.0, 0.0, 0.0, 0.0, bannerSlider(),),
                paddingAll(20.0, 0.0, 20.0, 0.0, productionSlider()),
                paddingAll(20.0, 0.0, 20.0, 0.0, moviesCollectionView()),
              ],
            )
        ),
      ),
    );
  }
}
