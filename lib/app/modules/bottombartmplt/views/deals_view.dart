import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DealsView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      
      body: Center(
        child: Text(
          'DealsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
