import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mifinity_task/Screens/Dashboard/dashboard_controller.dart';
import 'package:mifinity_task/Storage/storage.dart';

class SignInController extends GetxController{

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var emailId = '';
  var password = '';



  @override
  void onInit()async {
    Get.put(DashboardController());
    saveData();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    emailIdController.dispose();
    passwordController.dispose();
  }


  String? validateEmail(String value){
    if(!GetUtils.isEmail(value)){
      return "Provide a valid Email";
    }
    return null;
  }

  String? validatePassword(String value){
    RegExp regex =  RegExp(r'^(?=.*?[!@#\$&*~]).+$');
    if(value.length <8){
      return "Password should be minimum 8 characters";
    }
    if (!regex.hasMatch(value)) {
        return 'Please use atleast one Special Character';
    }
    return null;
  }

  Future<void> loginUser()async{
    final isValid = loginFormKey.currentState!.validate();
    if(!isValid){
      // print('not valid form');
      return ;
    }else{

    }

  }

}