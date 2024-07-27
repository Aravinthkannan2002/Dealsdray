import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool passtoggle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: GetBuilder<RegisterController>(
        builder: (Controller) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection:Axis.vertical,
            child: SafeArea(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                     Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Image.asset(
                  'assets/dealsdraybanner.png', // Replace with your image path
                  height: 100, // Adjust height as needed
                ),
                          ),
                     SizedBox(height: 50),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lets Begin!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Please enter Your Credentials To proceed ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),

Padding(
  padding: const EdgeInsets.all(20.0),
  child: TextFormField(
    controller:controller.email ,
    keyboardType: TextInputType.emailAddress,
    textAlign: TextAlign.start,
    autofocus: true,
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.email, color: Colors.black),
      hintText: 'Your Email',
      hintStyle: TextStyle(color: Colors.black54),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Colors.blue, width: 2.0),
      ),
    ),
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (value) => controller.validateEmail(value), 
  ),
),


                    //  SizedBox(height: 50),
                   

Padding(
  padding: const EdgeInsets.all(20.0),
  child: TextFormField(
    maxLength: 6,
    maxLengthEnforcement:null,
    obscureText: true,
     controller: controller.password,
    keyboardType: TextInputType.emailAddress,
    textAlign: TextAlign.start,
    autofocus: true,
    decoration: InputDecoration(
      suffixIcon: Icon(Icons.visibility_off,color: Colors.black,),
      prefixIcon: Icon(Icons.lock, color: Colors.black),
      hintText: 'Password',
      hintStyle: TextStyle(color: Colors.black54),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Colors.blue, width: 2.0),
      ),
    ),
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (value) => controller.validatePassword(value), 
  ),
),

                     SizedBox(height: 20),
                   
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.referralCode,
                        textAlign: TextAlign.start,
                        autofocus: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password_sharp, color: Colors.black),
                          hintText: 'Referral Code (Optional)',
                          hintStyle: TextStyle(color: Colors.black54),
                          border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Colors.blue, width: 2.0),
      ),
                          
                        ),
                       
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                    
                   
                  ],
                ),
              ),
            ),
          );
        }
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
        
            controller.signin();
            print('FAB Pressed');
          },
          child: Icon(Icons.arrow_forward,color: Colors.white,),
          backgroundColor: Colors.red,
        ),
      ),
    );
  }

}
