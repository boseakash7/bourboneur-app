import 'dart:async';
import 'dart:convert';

import 'package:bourboneur/Core/BaseApi.dart';
import 'package:bourboneur/Core/Controllers/BlueBooks.dart';
import 'package:bourboneur/Core/Controllers/LastUpdate.dart';
import 'package:get/get.dart';

class _Bluebook extends BaseApi {

  static String BLUEBOOK_GET_ALL = 'bluebook/get-all-bluebooks';
  static String BLUEBOOK_LAST_UPDATED_AT = 'bluebook/get-last-update';

   Future<dynamic> all(
    String page,
    String limit
   ) async {
    
    var data = {
      "page": page,
      "limit": limit
    };
    var response = await sendGet(BLUEBOOK_GET_ALL, query: data);
    if (response == null ) return false;
    if ( response.body['code'] != 'OK' ) {
      utils.showToast("Error", response.body['data']);
      return false;
    }

    List<BlueBook> cList = _parseBlueBook(response.body['data']['data']);

    controller.bluebooks.clear();
    controller.bluebooks.addAll(cList);

    return true;
  }

  Future<dynamic> lastUpdatedAt() async {
 
    var response = await sendGet(BLUEBOOK_LAST_UPDATED_AT);
    if (response == null ) return false;
    if ( response.body['code'] != 'OK' ) {
      utils.showToast("Error", response.body['data']);
      return false;
    }


    controller.lastUpdate.value = LastUpdate.fromJson({
      'bluebook_raw': response.body['data']['raw'],
      'bluebook_readable': response.body['data']['readable'],
    });

    return true;
  }

   List<BlueBook> _parseBlueBook(List responseBody) {
    List<BlueBook> list = [];
    for( var item in responseBody )
    {
      list.add(BlueBook.fromJson(item));
    }

    return list;
  }

}

_Bluebook BlueBookApi = Get.put(_Bluebook());
