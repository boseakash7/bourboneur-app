import 'dart:async';

import 'package:bourboneur/Core/BaseApi.dart';
import 'package:bourboneur/Core/Controllers/User.dart';
import 'package:get/get.dart';

class _User extends BaseApi {

  static String USER_GET_BY_ID = 'user/get-by-id';

  Future<dynamic> getById( String id ) async {
    var data = {
      "id": id
    };
    var response = await sendGet(USER_GET_BY_ID, query: data);
    if (response == null ) return false;
    if ( response.body['code'] != 'OK' ) {
      utils.showToast("Error", response.body['data']);
      return false;
    }

    controller.user.value = User.fromJson(response.body['data']);
    await utils.saveLocal('user_id', controller.user.value.id!);

    return true;
  }


}

_User UserApi = Get.put(_User());
