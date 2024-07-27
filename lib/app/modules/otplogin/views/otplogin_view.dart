
// import 'package:chatapp/app/modules/login/controllers/login_controller.dart';
// import 'package:chatapp/app/modules/login/views/login_view.dart';
// import 'package:chatapp/app/modules/login/views/signin_view.dart';
import 'package:chatapp/app/modules/preference%5B1%5D.dart';
import 'package:chatapp/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:pinput/pinput.dart';

import '../controllers/otplogin_controller.dart';

class OtploginView extends GetView<OtploginController> {
    final List<TextEditingController> otpControllers = List.generate(4, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(onPressed: (){
             Get.offAllNamed(Routes.STATUS);
          }, icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
        ),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: GetBuilder<OtploginController>(
        builder: (controller) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SafeArea(
              child: Center(
                child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              // Asset Image
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Image.asset(
                  'assets/otpimage.png', // Replace with your image path
                  height: 100, // Adjust height as needed
                ),
              ),
              // OTP Verification Title and Description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'OTP Verification',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'We have sent a unique OTP number \n to your Mobile ${Preference.mobilenumber}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 40),
                    
                    // OTP Input Fields
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: List.generate(
                          4,
                          (index) => Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextFormField(
                                 controller: otpControllers[index],
                                onChanged: (value){
                                  if (value.length==1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                onSaved: (pin1){},
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [LengthLimitingTextInputFormatter(1),
                                // FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  hintText: "0",
                                  border: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  counterText: '',
                                ),
                               
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
               
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Text(
                            '01:57',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                        Padding(
  padding: const EdgeInsets.all(10.0),
  child: TextButton(
    onPressed: () {
      // Your onPressed logic here
    },
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
    ),
    child: Text(
      "SEND AGAIN",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.grey[500],
        decoration: TextDecoration.underline,  // This adds the underline
      ),
    ),
  ),
),

                      ],
                    ),
                    
                      SizedBox(height: 40),
                    ElevatedButton(
  onPressed: () {
    String otp = otpControllers.map((controller) => controller.text).join();
    if (otp.length == 4) {
      controller.verifyOtp(otp); // Pass the OTP string
    } else {
      Get.snackbar(
        'Error', 
        'Please enter a valid 4-digit OTP',
        snackPosition: SnackPosition.BOTTOM,  // Position of the snackbar
        backgroundColor: Colors.red,  // Background color
        colorText: Colors.white,  // Text color
        borderRadius: 8.0,  // Border radius
        margin: EdgeInsets.all(10.0),  // Margin
        icon: Icon(Icons.error, color: Colors.white),  // Icon
        shouldIconPulse: true,  // Icon pulse animation
        barBlur: 20,  // Blur effect
        isDismissible: true,  // Can be dismissed
        duration: Duration(seconds: 1),  // Duration it stays on screen
        forwardAnimationCurve: Curves.easeOutBack,  // Forward animation
        reverseAnimationCurve: Curves.easeInBack,  // Reverse animation
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.red,
    elevation: 0,  // Remove shadow
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Center(
    child: Text(
      "Next",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.black,
        decoration: TextDecoration.none,  // Remove underline
      ),
    ),
  ),
),

                  ],
                ),
              ),
            ],
                ),
              ),
            ),
          );
        }
      ),
      
    );
  }
}
