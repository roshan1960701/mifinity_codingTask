import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mifinity_task/Colors/colors.dart';
import 'package:mifinity_task/Utility/utility.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
