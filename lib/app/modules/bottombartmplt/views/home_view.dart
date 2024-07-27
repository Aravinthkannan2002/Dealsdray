import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatapp/app/modules/homepage/controllers/homepage_controller.dart';

class HomeView extends GetView<HomepageController> {
@override
Widget build(BuildContext context) {
controller.gethomemodel();
return Scaffold(
  backgroundColor: Colors.white,
body: GetBuilder<HomepageController>(
builder: (controller) {
var firstHomemodel = controller.homemodelwholedata.isNotEmpty ? controller.homemodelwholedata[0] : null;
var bannerOneList = firstHomemodel?.data?.bannerOne ?? [];




return SingleChildScrollView(
  physics: BouncingScrollPhysics(),
child: SafeArea(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
// SizedBox(height: 20),

// Scrollable Row with additional Containers
SizedBox(
height: 200,
child: ListView.builder(

scrollDirection: Axis.horizontal,
physics: BouncingScrollPhysics(),
itemCount: bannerOneList.length,
itemBuilder: (context, index) {
var banner = bannerOneList[index];
return Container(
// width: 300.0,
height: 200.0,
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(15.0),
border: Border.all(
color: Colors.white,
width: 3.0,
),
boxShadow: [
BoxShadow(
color: Colors.white,
offset: Offset(4.0, 4.0),
blurRadius: 10.0,
),
],
),
padding: EdgeInsets.all(20.0),
margin: EdgeInsets.symmetric(horizontal: 8.0),
child: Center(
child: banner != null
? Image.network(
banner.banner!,
fit: BoxFit.cover,
errorBuilder: (context, error, stackTrace) {
return Text(
'No Image Available',
style: TextStyle(
color: Colors.white,
fontSize: 18.0,
),
);
},
)
: Text(
'No Image Available',
style: TextStyle(
color: Colors.white,
fontSize: 18.0,
),
),
),
);
},
),
),

SizedBox(height: 10),

Padding(
  padding: const EdgeInsets.all(10.0),
  child: Card(
  margin: EdgeInsets.zero,
  color: Colors.blue,
  elevation: 5,
  child: Container(
  height: 150,
  width: double.infinity,
  child: Center(
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Text(
  'KYC Pending',
  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
  ),
  SizedBox(height: 8),
  Text(
  'You need to provide the required \n documentation for your account activation.',
  style: TextStyle(color: Colors.white),
  textAlign: TextAlign.center,
  ),
  SizedBox(height: 20),
  GestureDetector(
  onTap: () {
  print('Link clicked');
  },
  child: Text(
  'Click here',
  style: TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  decoration: TextDecoration.underline,
  ),
  ),
  ),
  ],
  ),
  ),
  ),
  ),
),

SizedBox(height: 30),

// Centering the category circles
SizedBox(
height: 80,
child: Center(
child: SingleChildScrollView(
  physics: BouncingScrollPhysics(),
scrollDirection: Axis.horizontal,
child: Row(
mainAxisSize: MainAxisSize.min, // Ensure the Row takes only as much space as needed
children: List.generate(
controller.allcategories.length,
(index) {
var assetPath = controller.allcategories[index];
var label = controller.allcategorieslabel.isNotEmpty ? controller.allcategorieslabel[index] : 'Unknown';
return _buildCategoryCircle(
assetPath,
label,
);
},
),
),
),
),
),
SizedBox(height: 30),

Container(
height: 400,
width: double.infinity,
color: Colors.blue,
child: Column(
children: [
ListTile(
onTap: () {
showDialog(
context: context,
builder: (BuildContext context) {
return AlertDialog(
title: Text('Dialog Title'),
content: Text('This is a simple dialog message.'),
actions: [
TextButton(
child: Text('OK'),
onPressed: () {
Navigator.of(context).pop();
},
),
],
);
},
);
},
leading: Text(
'EXCLUSIVE FOR YOU',
style: TextStyle(
color: Colors.white,
fontSize: 18,
fontWeight: FontWeight.bold,
),
),
trailing: Icon(Icons.arrow_forward_sharp, color: Colors.white),
),
Expanded(
child: ListView.builder(
scrollDirection: Axis.horizontal,
physics: BouncingScrollPhysics(),
itemCount: controller.productsbannericon.length,
itemBuilder: (context, index) {
var imageUrl = controller.productsbannericon.isNotEmpty ? controller.productsbannericon[index] : '';
var label = controller.productsbannerlabel.isNotEmpty ? controller.productsbannerlabel[index] : 'Unknown';
var subLabel = controller.productsbannersublabel.isNotEmpty ? controller.productsbannersublabel[index] : 'No Details';
var offer = controller.productbanneroffer.isNotEmpty ? controller.productbanneroffer[index] : 'No Details';

return Padding(
padding: const EdgeInsets.symmetric(horizontal: 5.0), // Add some spacing between cards
child: _buildItemCard(
imageUrl,
label,
subLabel,
offer
),
);
},
),
),
],
),
),
// SizedBox(height: 30),

// Container(
// height: 400,
// width: double.infinity,
// color: Colors.blue,
// child: Column(
// children: [
// ListTile(
// onTap: () {
// showDialog(
// context: context,
// builder: (BuildContext context) {
// return AlertDialog(
// title: Text('Dialog Title'),
// content: Text('This is a simple dialog message.'),
// actions: [
// TextButton(
// child: Text('OK'),
// onPressed: () {
// Navigator.of(context).pop();
// },
// ),
// ],
// );
// },
// );
// },
// leading: Text(
// 'EXCLUSIVE FOR YOU',
// style: TextStyle(
// color: Colors.white,
// fontSize: 18,
// fontWeight: FontWeight.bold,
// ),
// ),
// trailing: Icon(Icons.arrow_forward_sharp, color: Colors.white),
// ),
// Expanded(
// child: ListView.builder(
// scrollDirection: Axis.horizontal,
// physics: BouncingScrollPhysics(),
// itemCount: controller.allcategories.length,
// itemBuilder: (context, index) {
// var imageUrl = controller.productsbannericon.isNotEmpty ? controller.productsbannericon[index] : '';
// var label = controller.productsbannerlabel.isNotEmpty ? controller.productsbannerlabel[index] : 'Unknown';
// var subLabel = controller.productsbannersublabel.isNotEmpty ? controller.productsbannersublabel[index] : 'No Details';
// var offer = controller.productbanneroffer.isNotEmpty ? controller.productbanneroffer[index] : 'No Details';
// return Padding(
// padding: const EdgeInsets.symmetric(horizontal: 5.0), // Add some spacing between cards
// child: _buildItemCard1(
// imageUrl,
// label,
// subLabel,
// // offer
// ),
// );
// },
// ),
// ),
// ],
// ),
// ),
],
),
),
);
},
),
floatingActionButton: Padding(
padding: const EdgeInsets.all(10.0),
child: SizedBox(
width: 120,
height: 50,
child: FloatingActionButton.extended(
onPressed: () {
// Show a Snackbar with chat text
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text('Chat button clicked'),
),
);
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
);
}

Widget _buildCategoryCircle(String assetPath, String label) {
return SizedBox(
width: 80,
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
mainAxisSize: MainAxisSize.min,
children: [
ClipOval(
child: Container(
width: 60,
height: 60,
child: Center(
child: Image.network(
assetPath,
fit: BoxFit.cover,
errorBuilder: (context, error, stackTrace) {
return Icon(Icons.error, size: 60);
},
),
),
),
),
SizedBox(height: 5),
Expanded(
child: FittedBox(
fit: BoxFit.scaleDown,
child: Text(
label,
style: TextStyle(fontSize: 14),
textAlign: TextAlign.center,
),
),
),

],
),
);
}

Widget _buildItemCard(String imageUrl, String label, String subLabel,String offer) {
return  Card(
  color: Colors.white,
  elevation: 4.0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 160,
      height: 200,
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.network(
                imageUrl,
                width: 150, // Adjust the width as needed
                height: 150, // Adjust the height as needed
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error, size: 80);
                },
              ),
              Positioned(
                top: 0,
                right: 0,
                child: ClipRRect(
  borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
  child: Container(
    width: 50, // Set the width of the offer rectangle
    height: 30, // Set the height of the offer rectangle
    color: Colors.green, // Set the color of the rectangle for the offer
    child: Center(
      child: Text(
        offer,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  ),
)

              ),
            ],
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.currency_rupee_outlined),
            subtitle: Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            subLabel,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
  ),
);


}

Widget _buildItemCard1(String label, String subLabel,String offer) {
return  Card(
  color: Colors.white,
  elevation: 4.0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 160,
      height: 200,
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.network(
                label,
                width: 150, // Adjust the width as needed
                height: 150, // Adjust the height as needed
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error, size: 80);
                },
              ),
              Positioned(
                top: 0,
                right: 0,
                child: ClipRRect(
  borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
  child: Container(
    width: 50, // Set the width of the offer rectangle
    height: 30, // Set the height of the offer rectangle
    color: Colors.green, // Set the color of the rectangle for the offer
    child: Center(
      child: Text(
        offer,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  ),
)

              ),
            ],
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.currency_rupee_outlined),
            subtitle: Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            subLabel,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
  ),
);


}

}