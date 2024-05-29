import 'dart:async';

import 'package:bourboneur/Core/BaseApi.dart';
import 'package:bourboneur/Core/Constants.dart';
import 'package:bourboneur/Core/Controllers/Config.dart';
import 'package:bourboneur/Core/Controllers/User.dart';
import 'package:get/get.dart';

class _Config extends BaseApi {

  static String GET_ALL = 'config/all';

  Future<dynamic> all() async {
    var response = await sendGet(GET_ALL);
    if (response == null ) return false;
    if ( response.body['code'] != 'OK' ) {
      utils.showToast("Error", response.body['data']);
      return false;
    }

    controller.config.value = Config.fromJson(response.body['data']);

    return true;
  }


}

_Config ConfigApi = Get.put(_Config());
