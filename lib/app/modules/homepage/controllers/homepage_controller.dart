import 'dart:convert';
import 'package:chatapp/app/modules/models/Homemodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomepageController extends GetxController {
var homemodelwholedata = <Homemodel>[].obs;
var bannerOneList = <String>[].obs; // Ensure this is a list of String URLs
var allcategories = <String>[].obs;
var allcategorieslabel = <String>[].obs;
var productsbannericon = <String>[].obs;
var productbanneroffer = <String>[].obs;
var productsbannerlabel = <String>[].obs;
var productsbannersublabel = <String>[].obs;
var homeModel = Rx<Homemodel?>(null);

@override
void onInit() {
super.onInit();
print('HomepageController initialized');
gethomemodel(); // Fetch data when the controller is initialized
}

void gethomemodel() async {
try {
final response = await http.get(Uri.parse('http://devapiv4.dealsdray.com/api/v2/user/home/withoutPrice'));

if (response.statusCode == 200) {
final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
final homeModelData = Homemodel.fromJson(jsonResponse);

// Update reactive variables
homemodelwholedata.value = [homeModelData];
bannerOneList.value = homeModelData.data.bannerOne.map((b) => b.banner).toList();
allcategories.value = homeModelData.data.category.map((b) => b.icon).toList();
allcategorieslabel.value = homeModelData.data.category.map((b) => b.label).toList();
productsbannericon.value = homeModelData.data.products.map((b) => b.icon).toList();
productbanneroffer.value = homeModelData.data.products.map((b) => b.offer).toList();
productsbannerlabel.value = homeModelData.data.products.map((b) => b.label).toList();
productsbannersublabel.value = homeModelData.data.products.map((b) => b.subLabel).toList();

print('Parsed HomeModel: ${homeModelData.data.bannerOne}');
print('Banner One List: ${bannerOneList}');
} else {
print('Failed to load data');
}
} catch (e) {
print('Error: $e');
}
update();
}
}