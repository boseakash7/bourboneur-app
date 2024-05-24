import 'dart:async';

import 'package:bourboneur/Core/BaseApi.dart';
import 'package:bourboneur/Core/Controllers/WOD.dart';
import 'package:get/get.dart';

class _WOD extends BaseApi {

  static String WOD_CREATE = 'destiny/create';
  static String WOD_UPDATE = 'destiny/update';
  static String WOD_BY_USER = 'destiny/get-all-wheels';
  static String WOD_BY_ID = 'destiny/get-by-id';
  static String WOD_DELETE_BY_ID = 'destiny/delete';

  Future<dynamic> create(
    String userId,
    String name,
    String data
  ) async {
    
    var d = {
      "user_id": userId,
      "wheel_name": name,
      "data": data,
    };
    var response = await sendPost(WOD_CREATE, d);
    if (response == null ) return false;
    if ( response.body['code'] != 'OK' ) {
      utils.showToast("Error", response.body['data']);
      return false;
    }

    controller.wods.insert(0, WOD(
      id: response.body['data']['id'],
      data: response.body['data']['data'],
      name: response.body['data']['wheel_name'],
      userId: response.body['data']['user_id']
    ));

    return response.body['data']['id'];
  }

   Future<dynamic> update(
    String id,
    String userId,
    String name,
    String data
  ) async {
    
    var d = {
      "wheel_id": id,
      "user_id": userId,
      "wheel_name": name,
      "data": data,
    };
    var response = await sendPost(WOD_UPDATE, d);
    if (response == null ) return false;
    if ( response.body['code'] != 'OK' ) {
      utils.showToast("Error", response.body['data']);
      return false;
    }

    int index = controller.wods.indexWhere((element) => element.id == id);
    controller.wods.removeAt(index);
    controller.wods.insert(index,  WOD(
      id: id,
      data: data,
      name: name,
      userId: userId
    ));

    return id;
  }

  Future<dynamic> byUserId(
    String userId
   ) async {
    
    var data = {
      "user_id": userId
    };
    var response = await sendPost(WOD_BY_USER, data);
    if (response == null ) return false;
    if ( response.body['code'] != 'OK' ) {
      utils.showToast("Error", response.body['data']);
      return false;
    }

    List<WOD> cList = _parseWOD(response.body['data']);

    controller.wods.clear();
    controller.wods.addAll(cList);

    return true;
  }

  Future<dynamic> getById(
    String id
   ) async {
    
    var data = {
      "id": id
    };
    var response = await sendGet(WOD_BY_ID, query: data);
    if (response == null ) return false;
    if ( response.body['code'] != 'OK' ) {
      utils.showToast("Error", response.body['data']);
      return false;
    }

    controller.wod.value = WOD.fromJson(response.body['data']);

    return true;
  }

  Future<dynamic> deleteById(
    String id
   ) async {
    
    var data = {
      "wheel_id": id
    };
    var response = await sendPost(WOD_DELETE_BY_ID, data);
    if (response == null ) return false;
    if ( response.body['code'] != 'OK' ) {
      utils.showToast("Error", response.body['data']);
      return false;
    }

    controller.wods.value.removeWhere((element) {
      return element.id == id;
    });

    return true;
  }


  List<WOD> _parseWOD(List responseBody) {
    List<WOD> list = [];
    for( var item in responseBody )
    {
      list.add(WOD.fromJson(item));
    }

    return list;
  }

}

_WOD WODApi = Get.put(_WOD());
