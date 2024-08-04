import 'package:flutter/material.dart';
import 'sign_in_controller.dart';
import 'package:mifinity_task/Colors/colors.dart';
import 'package:get/get.dart';
import 'package:mifinity_task/Utility/utility.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mifinity_task/Router/app_router.gr.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final signInController = Get.put(SignInController());
 bool visible = true;


  @override
  initState() {
    super.initState();
  }

 Widget labelText(text,align){
    return Align(
      alignment: align,
      child: Text(text,style: TextStyle(
        color: labelTextColor,
        fontSize: getFontSize(context, 16),
        fontWeight: FontWeight.w400,
      )),
    );
  }

  Widget logoDisplay(){
    return SizedBox(
      height: getHeight(context) * 0.2,
      width: getWidth(context) * 0.45,
      // color: Colors.red,
      child: Image.asset('assets/disney-hotstar-logo.png', fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget emailField(context){
    return TextFormField(
      cursorColor: primaryColor,
      keyboardType: TextInputType.emailAddress,
      controller: signInController.emailIdController,
      minLines: 1,
      style: TextStyle(
        fontSize: getFontSize(context, 16),
        color: grayColor,
        fontWeight: FontWeight.w200,
      ),
      onSaved: (value){
        signInController.emailId = value!;
      },
      validator: (value){
        return signInController.validateEmail(value!);
      },
      decoration: InputDecoration(
        hintText: 'Email Address',
        enabled: true,
        filled: true,
        fillColor: bgColor.withOpacity(0.5),
        hintStyle: TextStyle(
          fontSize: getFontSize(context, 16),
          color: grayColor,
          fontWeight: FontWeight.w100,
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
    );
  }

  Widget passwordField(context){
    return TextFormField(
      cursorColor: primaryColor,
      keyboardType: TextInputType.text,
      obscureText: visible,
      textAlign: TextAlign.start,
      controller: signInController.passwordController,
      style: TextStyle(
        fontSize: getFontSize(context, 16),
        color: grayColor,
        fontWeight: FontWeight.w200,
      ),
      onSaved: (value){
        signInController.password = value!;
      },
      validator: (value){
        return signInController.validatePassword(value!);
      },
      minLines: 1,
      decoration: InputDecoration(
        hintText: 'Password',
        enabled: true,
        filled: true,
        fillColor: bgColor.withOpacity(0.5),
        suffixIcon: paddingAll(0.0, 0.0, 0.0, 10.0, IconButton(
            splashColor: whiteColor,
            onPressed: () async{
              setState(() {
              visible = !visible;
              });
            }, icon: visible ? const Icon(Icons.visibility_rounded,color: grayColor) : const Icon(Icons.visibility_off_rounded,color: grayColor,) )),

        hintStyle: TextStyle(
          fontSize: getFontSize(context, 16),
          color: grayColor,
          fontWeight: FontWeight.w100,

        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          borderSide: BorderSide(color: bgColor.withOpacity(0.5),width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          borderSide: BorderSide(color: bgColor.withOpacity(0.5),width: 1),
        ),
      ),
    );
  }

  Widget loginBtn(context,btnName){
    return Container(
        width: getWidth(context),
        height: 46,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: btnColor,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          boxShadow:[BoxShadow(
            color: btnColor.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 0,
            offset: Offset(1, 1), // changes position of shadow
          ),],
        ),
        child: Center(
          child: Text(btnName, style: TextStyle(
            fontSize: getFontSize(context, 16),
            color: labelTextColor,

          ),),
        )
    );
  }

  Widget loginForm(context){
    return Form(
      key: signInController.loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            paddingAll(70.0, 0.0, 0.0, 0.0, logoDisplay(),),
            paddingAll(0.0, 0.0, 20.0, 0.0, labelText('Email',Alignment.centerLeft),
            ),
            paddingAll(0.0, 0.0, 20.0, 20.0, emailField(context),),
            paddingAll(20.0, 0.0, 20.0, 0.0, labelText('Password',Alignment.centerLeft),),
            paddingAll(0.0, 0.0, 20.0, 20.0, passwordField(context),),
            paddingAll(40.0, 0.0, 20.0, 0.0, labelText('Forgot Password?',Alignment.centerLeft),),
            paddingAll(10.0, 0.0, 20.0, 20.0, InkWell(
              highlightColor: btnColor,
              splashColor: btnColor,
              onTap: ()async{
                // final isValid = signInController.loginFormKey.currentState!.validate();
                // isValid ? AutoRouter.of(context).push(DashboardRoute()): (){};
                AutoRouter.of(context).push(DashboardRoute());
              },
              child: loginBtn(context,'Sign In'),
            )),
            paddingAll(40.0, 0.0, 0.0, 0.0, labelText('Not a Member yet? Start your free month!',Alignment.center),),



          ],
        )
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      body: Container(
        height: getHeight(context),
        width: getWidth(context),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [bgColor,bgColorSecond],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0,0.9]
            ),
        ),
        child: SingleChildScrollView(
          child: loginForm(context),
        ),
      )
    );
  }
}
