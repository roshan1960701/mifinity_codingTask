import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/*Provide padding from all Sides*/
paddingAll(top,bottom,left,right,widget){
  return Padding(padding: EdgeInsets.only(top: top,bottom: bottom,left: left,right: right),
    child: widget,
  );
}

 /*Provide Responsive Font Size*/
getFontSize(BuildContext context, double baseFontSize) {
  double screenWidth = MediaQuery.of(context).size.width;
  const double baseScreenWidth = 375.0; // Standard screen width
  double scaleFactor = screenWidth / baseScreenWidth;
  return baseFontSize * scaleFactor;
}

/*Provide Responsive Height*/
getHeight(context){
  return MediaQuery.of(context).size.height;
}

/*Provide Responsive Width*/
getWidth(context){
  return MediaQuery.of(context).size.width;
}

