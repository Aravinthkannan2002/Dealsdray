// import 'package:chatapp/app/modules/homepage/views/home_view.dart';
import 'package:chatapp/app/modules/bottombartmplt/views/home_view.dart';
import 'package:chatapp/app/routes/app_pages.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/homepage_controller.dart';
import 'package:chatapp/app/modules/bottombartmplt/views/bottombartmplt_view.dart';

class HomepageView extends GetView<HomepageController> {
@override
Widget build(BuildContext context) {
// controller.gethomemodel();
return Scaffold(
appBar: AppBar(
foregroundColor: Colors.black,
backgroundColor: Colors.white,
leading: Padding(
padding: const EdgeInsets.all(8.0),
child: IconButton(
icon: Icon(Icons.menu, color: Colors.black),
onPressed: () {},
),
),
title: Container(
margin: EdgeInsets.symmetric(horizontal: 01),
child: Row(
mainAxisSize: MainAxisSize.max,
children: [
Expanded(
child: Container(
decoration: BoxDecoration(
color: Colors.grey[200],
borderRadius: BorderRadius.circular(10),
boxShadow: [
BoxShadow(
color: Colors.grey.withOpacity(0.2),
spreadRadius: 1,
blurRadius: 5,
offset: Offset(0, 2),
),
],
),
child: TextField(
maxLength: 15,
decoration: InputDecoration(
border: InputBorder.none,
hintText: 'Search here',
contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
hintStyle: TextStyle(color: Colors.grey),
prefixIcon: Image.asset('assets/smallicon1.png'),
suffixIcon: Padding(
padding: const EdgeInsets.all(5.0),
child: Icon(Icons.search, color: Colors.black),
),
counterText: '',
),
),
),
),
],
),
),
actions: [
Padding(
padding: const EdgeInsets.all(8.0),
child: IconButton(
icon: Icon(Icons.logout, color: Colors.black),
onPressed: () {
  Get.offAllNamed(Routes.STATUS);
},
),
),
],
elevation: 0,
),
body: HomeView(),
backgroundColor: Colors.white,
resizeToAvoidBottomInset: true,
floatingActionButton: Padding(
padding: const EdgeInsets.all(10.0),
child: SizedBox(
width: 120,
height: 50,
child: FloatingActionButton.extended(
onPressed: () {
// Show a Snackbar with chat text
},
icon: Icon(Icons.message, color: Colors.white),
label: Text(
'Chat',
style: TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold,
),
),
backgroundColor: Colors.red,
),
),
),
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.red,
        items:[
          Icon(Icons.home),
     Icon(Icons.category),
   Icon(Icons.local_offer),
     Icon(Icons.shopping_cart),
    Icon(Icons.person),
        ],
        // backgroundColor: bgcolor,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          if (index==0) {
          //  bgcolor;
print("I am red color");
          }else if(index==1){
            // ground;
            print("iam a blue color");
          };
          print(index); // Call controller method to change color
        },
      ),
);
}
}