import 'dart:convert';

import 'package:chatapp/app/modules/preference%5B1%5D.dart';

import 'package:chatapp/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
   var passtoggle = false.obs;
    // var email = TextEditingController();
  var emailErrorMessage = ''.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController referralCode = TextEditingController();
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
 String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      emailErrorMessage.value = 'Email is required';
      return emailErrorMessage.value;
    }
    if (!GetUtils.isEmail(value)) {
      emailErrorMessage.value = 'Enter a valid email';
      return emailErrorMessage.value;
    }
    emailErrorMessage.value = '';
    
  }

 String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      emailErrorMessage.value = 'Please enter your password';
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    
  }

  @override
  void onInit() {
    super.onInit();
  }
  Future<void> signin() async {
    final String apiUrl = 'http://devapiv4.dealsdray.com/api/v2/user/email/referral';

    final Map<String, dynamic> input = {
      "email": email.text.toString(),
      "password": password.text.toString(),
      "referralCode": referralCode.text.toString(),
      "userId": Preference.userid
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode(input),
        headers: {'Content-Type': 'application/json'},
      );

      print('url: $apiUrl');
      print('statuscode: ${response.statusCode}'); // Log response data
      print('input: $input'); // Log response data

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print('Response data: $jsonData'); // Log response data

        if (jsonData['status'] == 1) {
          
            Get.offAllNamed(Routes.HOMEPAGE); 
           Get.snackbar('Success', 'Successfully Added',titleText: Text("Success",
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
          backgroundColor: Colors.green,shouldIconPulse: true, 
          icon: Icon(Icons.check_circle, color: Colors.white), // Icon pulse animation
  barBlur: 20,  // Blur effect
  isDismissible: true,  // Can be dismissed
  duration: Duration(seconds: 1),  // Duration it stays on screen
  forwardAnimationCurve: Curves.easeOutBack,  // Forward animation
  reverseAnimationCurve: Curves.easeInBack,);
         
        } else {
          Get.snackbar('Error', 'Not Successfully Added',
          titleText: Text("Error",
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
          backgroundColor: Colors.red,shouldIconPulse: true, 
          icon: Icon(Icons.error, color: Colors.white), // Icon pulse animation
  barBlur: 20,  // Blur effect
  isDismissible: true,  // Can be dismissed
  duration: Duration(seconds: 1),  // Duration it stays on screen
  forwardAnimationCurve: Curves.easeOutBack,  // Forward animation
  reverseAnimationCurve: Curves.easeInBack,);
        }
      } else {
        throw Exception('User Already exist');
      }
    } catch (e) {
      print('Error verifying OTP: $e');
      Get.snackbar('Error', 'Something went wrong',
          titleText: Text("Error",
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
          backgroundColor: Colors.red,shouldIconPulse: true, 
          icon: Icon(Icons.error, color: Colors.white), // Icon pulse animation
  barBlur: 20,  // Blur effect
  isDismissible: true,  // Can be dismissed
  duration: Duration(seconds: 1),  // Duration it stays on screen
  forwardAnimationCurve: Curves.easeOutBack,  // Forward animation
  reverseAnimationCurve: Curves.easeInBack,);
    }
    update();
  }

  



}
