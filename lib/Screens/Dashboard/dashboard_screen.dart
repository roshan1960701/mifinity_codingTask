import 'package:flutter/material.dart';
import 'package:mifinity_task/Utility/utility.dart';
import 'package:mifinity_task/Colors/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mifinity_task/Router/app_router.gr.dart';
import 'package:mifinity_task/Screens/Dashboard/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:mifinity_task/Screens/Dashboard/home_screen.dart';
import 'package:mifinity_task/Screens/Dashboard/download_screen.dart';
import 'package:mifinity_task/Screens/Dashboard/profile_screen.dart';
import 'package:mifinity_task/Screens/Dashboard/search_screen.dart';
import 'package:lottie/lottie.dart';


@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

   final dashboardController = Get.find<DashboardController>();


   @override
   initState(){
     super.initState();
     dashboardController.fetchHomeData();
   }

   Widget menuIcons(value,data){
     return InkWell(
       onTap: (){
         if(value == 2){
           customDialog();
         }else{
           dashboardController.navBarSelectedIndex.value = value;
           dashboardController.pageController.jumpToPage(value);
         }

       },
       splashColor: bgColor,
       highlightColor: bgColor,
       child: Icon(data,color:dashboardController.navBarSelectedIndex.value == value ? Colors.white : Colors.white.withOpacity(0.5),size: 30.0,),
     );
   }


customDialog(){
  showDialog(context: context, builder: (context){
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(10.0)),
      child: Container(
        height: 250,
        // color: bgColor.withOpacity(0.4),
        child: paddingAll(10.0, 10.0, 10.0, 10.0, Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 120.0,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              child: Lottie.asset('assets/downloadFailed.json',
                width: 120,
                height: 120,
              ),
            ),
            Text('Download feature will be available later!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: navyBlueColor,
                  fontSize: getFontSize(context, 18),
                  fontWeight: FontWeight.w700,
                )),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white,
                  fontSize: getFontSize(context, 18),
                  fontWeight: FontWeight.w700,
                ),
              ),
              color: bgColorSecond.withOpacity(0.8),
              // color: Color(0xFF1BC0C5),
            ),
          ],
        )),
      ),
    );
  });
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          body:  PageView(
            controller: dashboardController.pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index){
              //bottomSelectedIndex = index;
              dashboardController.navBarSelectedIndex.value = index;
            },
            children: const [
              HomeScreen(),
              SearchScreen(),
              DownloadScreen(),
              ProfileScreen()
            ],
          ),
            bottomNavigationBar: Obx(
                    () => BottomAppBar(
                      color: bgColor,
                  height: getHeight(context) * 0.07,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      menuIcons(0,Icons.home),
                      menuIcons(1,Icons.search_outlined),
                      menuIcons(2,Icons.download_rounded),
                      menuIcons(3,Icons.person),


                    ],
                  ),

                )
            )
    ));
    /*AutoTabsScaffold(
      backgroundColor: bgColor,
      routes: const [
        HomeRoute(),
        SearchRoute(),
        DownloadRoute(),
        ProfileRoute()
      ],

      bottomNavigationBuilder: (context,tabsRouter){
        return BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            selectedItemColor: Colors.red,

            backgroundColor: Colors.yellow,
            items: [
              BottomNavigationBarItem(
              icon: Icon(Icons.home,color: bgColor,),
              label: 'Home',
            ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.download_rounded),
                label: 'Download',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_4_rounded),
                label: 'Profile',
              ),
            ]
        );
      },
      *//*body:Container(
        height: getHeight(context),
        width: getWidth(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [bgColor,bgColorSecond],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0,0.8]
          )

        ),


      ),*//*

    );*/
  }

   @override
   void dispose() {
     super.dispose();
     dashboardController.bannerList.clear();
     dashboardController.productionList.clear();
     dashboardController.moviesDataList.clear();
     dashboardController.dataLoading.value = false;
   }
}
