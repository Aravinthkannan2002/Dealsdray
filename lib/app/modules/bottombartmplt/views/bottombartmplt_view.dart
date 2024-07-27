import 'package:chatapp/app/modules/bottombartmplt/views/home_view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bottombartmplt_controller.dart';

class BottombartmpltView extends GetView<BottombartmpltController> {
  // final List<Widget> _navigationitem = [
  //   Icon(Icons.home),
  //    Icon(Icons.category),
  //  Icon(Icons.local_offer),
  //    Icon(Icons.shopping_cart),
  //   Icon(Icons.person),
  //   // const Icon(Icons.dashboard),
  // ];

  final Color bgcolor = Colors.red;
   final Color ground = Colors.blue;

  @override
  Widget build(BuildContext context) {
    final BottombartmpltController controller = Get.put(BottombartmpltController());

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 249, 247, 247),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              // Handle menu icon press
            },
          ),
        ),
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 1),
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
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
              icon: Icon(Icons.notifications_none_outlined, color: Colors.black),
              onPressed: () {
                Get.to(() => BottombartmpltView());
              },
            ),
          ),
        ],
        elevation: 0,
      ),
      body: GetBuilder<BottombartmpltController>(
        builder: (controller) {
          return Container(
            color: ground,
             
          );
        }
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
           bgcolor;
print("I am red color");
          }else if(index==1){
            ground;
            print("iam a blue color");
          };
          print(index); // Call controller method to change color
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: 120, // Set your desired width
          height: 50, // Set your desired height
          child: FloatingActionButton.extended(
            onPressed: () {
              Get.to(HomeView());
            },
            icon: Icon(Icons.message, color: Colors.white,),
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
    );
  }
}
