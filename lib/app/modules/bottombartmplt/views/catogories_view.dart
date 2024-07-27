import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CatogoriesView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
     
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SingleChildScrollView(
                
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                width: 300.0,
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 3.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(30.0),
                child: Center(
                  child: Text(
                    'Hello, Flutter!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                          ),
                    Container(
                width: 300.0,
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 3.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(30.0),
                child: Center(
                  child: Text(
                    'Hello, Flutter!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                          ),
                Container(
                width: 300.0,
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 3.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(30.0),
                child: Center(
                  child: Text(
                    'Hello, Flutter!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                          ),
                   
                  ],
                ),
              ),
              
            ],
          ),
        )
      )
    );
  }
}
