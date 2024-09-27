import 'dart:async';
import 'dart:io';

import 'package:bourboneur/Core/BaseApi.dart';
import 'package:bourboneur/Core/Controllers/Package.dart';
import 'package:get/get.dart';

class _Package extends BaseApi {

  static String GET_ALL = 'package/get-all';
  static String Subscribe = 'package/subscribe';

  Future<dynamic> all() async {
    var response = await sendGet(GET_ALL);
    if (response == null) return false;
    if (response.body['code'] != 'OK') {
      utils.showToast("Error", response.body['data']);
      return false;
    }

    List<Package> cList = _parseBlueBook(response.body['data']);

    controller.packages.clear();
    controller.packages.addAll(cList);

    return true;
}

Future<dynamic> subscribe(
    String userId,
    String packageId,
    String uniqueId
  ) async {
    
    var data = {
      "user_id": userId,
      "unique_id": uniqueId,
      "package_id": packageId,
      "payment_method": Platform.isIOS ? 'apple_in_app' : 'stripe'
    };

    var response = await sendPost(Subscribe,  data);
    if (response == null ) return false;
    if ( response.body['code'] != 'OK' ) {
      utils.showToast("Error", response.body['data']);
      return false;
    }
    utils.showToast("Success", "You have successfully subscribed to our premium plan");
    

    return true;
  }


}

_Package PackageApi = Get.put(_Package());
