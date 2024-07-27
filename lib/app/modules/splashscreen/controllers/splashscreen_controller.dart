import 'dart:convert';

import 'package:chatapp/app/modules/models/Homemodel.dart';
import 'package:chatapp/app/modules/preference%5B1%5D.dart';

import 'package:chatapp/app/routes/app_pages.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class SplashscreenController extends GetxController {
    List<Homemodel> homemodelwholedata = [];
  String _androidID = '';
  String get androidID => _androidID;
  String _deviceName = "";
  String _devicetype = "";
  String _deviceOSVersion = "";
  String _deviceIPAddress = "";
  double _lat = 0.0;
  double _long = 0.0;


  @override
  void onInit() {
    super.onInit();
    // Navigate to home screen after initialization
    getallinfo();
  }

  @override
  void onReady() {
    super.onReady();
  }
  void getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo;

    try {
      if (GetPlatform.isAndroid) {
        _devicetype = "Android";
        androidInfo = await deviceInfo.androidInfo;
        _androidID = androidInfo.id ?? "";
        _deviceName = androidInfo.model ?? "";
        _deviceOSVersion = androidInfo.version.release ?? "";
        _deviceIPAddress = await _getIPAddress();
 //      Position position = await _getCurrentLocation();
        // _lat = position.latitude;
        // _long = position.longitude;
      
      } else if (GetPlatform.isIOS) {
        // iOS device info handling here
        _devicetype = "IOS";
     
      }
    } catch (e) {
      print('Error getting device information: $e');
    }
  }

  Future<String> _getIPAddress() async {
    try {
      final response = await http.get(Uri.parse('https://api.ipify.org?format=json'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['ip'];
      } else {
        throw Exception('Failed to fetch IP address');
      }
    } catch (e) {
      print('Error fetching IP address: $e');
      return '';
    }
  }

  // Future<Position> _getCurrentLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Location services are disabled.');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
    
  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   } 

  //   return await Geolocator.getCurrentPosition();
  // }

  @override
  void onClose() {}
  Future<void> getallinfo() async {
    final String apiUrl = 'http://devapiv4.dealsdray.com/api/v2/user/device/add';
    final Map input = {
      "deviceType": _devicetype,
      "deviceId": _androidID,
      "deviceName": _deviceName,
      "deviceOSVersion": _deviceOSVersion,
      "deviceIPAddress": _deviceIPAddress,
      "lat": _lat,
      "long": _long,
      "buyer_gcmid": "",
      "buyer_pemid": "",
      "app": {
        "version": "1.20.5", // Replace with actual app version
        "installTimeStamp": "2022-02-10T12:33:30.696Z", // Replace with actual timestamps
        "uninstallTimeStamp": "2022-02-10T12:33:30.696Z",
        "downloadTimeStamp": "2022-02-10T12:33:30.696Z"
      }
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode(input),
      headers: {
        'Content-Type': 'application/json',
      },
    );
 print(input);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData);
      if (jsonData['status'] == 1) {
       // List<dynamic> appdata = jsonData['data'];
        Preference.deviceid = jsonData['data']['deviceId'];

        print('preferencedeviceid: ${Preference.deviceid}'); 


       navigateToHome();
        update();
      } else {
        throw Exception('API response status is not 1');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }


  // Private method to handle navigation
  void navigateToHome() async {
    await Future.delayed(Duration(seconds: 3)); // Wait for 3 seconds
    // Navigate to home screen after delay
    Get.offAllNamed(Routes.STATUS);
  }
}
