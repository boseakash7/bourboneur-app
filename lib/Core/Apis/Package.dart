import 'dart:async';

import 'package:bourboneur/Core/BaseApi.dart';
import 'package:bourboneur/Core/Controllers/Package.dart';
import 'package:get/get.dart';

class _Package extends BaseApi {

  static String GET_ALL = 'package/get-all';

   Future<dynamic> all() async {
  
    var response = await sendGet(GET_ALL);
    if (response == null ) return false;
    if ( response.body['code'] != 'OK' ) {
      utils.showToast("Error", response.body['data']);
      return false;
    }

    List<Package> cList = _parseBlueBook(response.body['data']);

    controller.packages.clear();
    controller.packages.addAll(cList);

    return true;
  }

   List<Package> _parseBlueBook(List responseBody) {
    List<Package> list = [];
    for( var item in responseBody )
    {
      list.add(Package.fromJson(item));
    }

    return list;
  }

}

_Package PackageApi = Get.put(_Package());
