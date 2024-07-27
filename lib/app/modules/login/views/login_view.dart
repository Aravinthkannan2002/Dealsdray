
// import 'package:chatapp/app/modules/login/views/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class StatusView extends GetView<StatusController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body:SingleChildScrollView(
        physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: SafeArea(
              child: Center(
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
                          'Glad to see you..!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Please Provide your Phone number',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                     Container(
            width: 280, // Adjust this value as needed
            child: IntlPhoneField(
              dropdownIcon: Icon(Icons.arrow_drop_down_sharp),
              focusNode: FocusNode(),
              dropdownTextStyle: TextStyle(fontSize: 18),
              controller: controller.phoneController,
              style: TextStyle(fontSize: 18),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
          labelText: 'Phone Number',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(),
          ),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
          print(phone.completeNumber);
              },
            ),
          ),
                   
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: (){
                        controller.login();
                      },
                      // onPressed: controller.login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'SEND CODE',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
       
     
    );
  }
}
