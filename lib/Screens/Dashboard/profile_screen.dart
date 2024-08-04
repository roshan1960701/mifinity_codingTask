import 'package:flutter/material.dart';
import 'package:mifinity_task/Colors/colors.dart';
import 'package:mifinity_task/Utility/utility.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final List<String> profileMenuList = ['Watchlist','App Settings','Account','Legal','Help','Log Out'];


  Widget profiles(src,text,selected){
    return Container(
      // color: Colors.pink,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  width: 2.0,
                  color: selected? Colors.white: Colors.transparent)
            ),
            child: ClipOval(
              child: Image.asset(
                src,
                height: 80.0,
                width: 80.0,
                fit:BoxFit.cover, //change image fill type
              ),
            )
          ),
          Text(text,style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: getFontSize(context, 16),
            fontWeight: FontWeight.w500,
          )),

        ],
      ),
    );
  }

  Widget allProfiles(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        profiles('assets/profile.jpeg','Alex',false),
        paddingAll(0.0, 0.0, 10.0, 10.0, profiles('assets/profile_pic.jpg','ROSHAN',true),),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.4),),
                  child: Icon(Icons.add,size: 40.0,color: Colors.white.withOpacity(0.5),)
              ),
              Text('Add Profile',style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: getFontSize(context, 16),
                fontWeight: FontWeight.w500,
              )),
            ]
          ),
        ),
      ],
    );
  }


  Widget editProfileBtn(){
    return Container(
        width: getWidth(context),
        height: 46,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Center(
          child: Text("EDIT PROFILES", style: TextStyle(
            fontSize: getFontSize(context, 16),
            color: Colors.white.withOpacity(0.8),
            fontWeight: FontWeight.bold
          ),),
        )
    );
  }

  Widget profileOptionTiles(optionName){
    return paddingAll(0.0, 15.0, 0.0, 0.0, Container(
      width: getWidth(context),
      height: getHeight(context) * 0.05,
      // color: Colors.yellowAccent,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: paddingAll(0.0, 0.0, 10.0, 0.0, Text(optionName,style: TextStyle(
                color: Colors.white,
                fontSize: getFontSize(context, 18),
                fontWeight: FontWeight.w500,
              )),)),
          Align(
            alignment: Alignment.centerRight,
            child: paddingAll(0.0, 0.0, 0.0, 10.0, Icon(Icons.arrow_forward_ios_rounded,color: Colors.white.withOpacity(0.2),)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: paddingAll(getHeight(context) * 0.05, 0.0, 10.0, 0.0, Divider(
              color: Colors.white.withOpacity(0.2),),
            ),)
        ],
      ),
    ));
  }

  Widget profileOptionsListView(){
    return Container(
      width: getWidth(context),
      height: getHeight(context) * 0.07 * profileMenuList.length,
      // color: Colors.yellow,
      child: ListView.builder(
          itemCount: profileMenuList.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext,index){
        return profileOptionTiles(profileMenuList[index]);
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
                paddingAll(25.0, 0.0, 0.0, 0.0, allProfiles(),),
                paddingAll(25.0, 0.0, getWidth(context) * 0.3, getWidth(context) * 0.3, editProfileBtn(),),
                paddingAll(25.0, 0.0, 0.0, 0.0, profileOptionsListView(),),
                Align(
                  alignment: Alignment.centerLeft,
                  child: paddingAll(0.0, 0.0, 10.0, 10.0, Text('Version: 1.5.1',style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: getFontSize(context, 18),
                    fontWeight: FontWeight.w500,
                  ))),
                ),
              ],
            )
        ),
      ),
    );
  }
}
