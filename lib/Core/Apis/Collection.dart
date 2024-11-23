import 'dart:async';
import 'dart:convert';

import 'package:bourboneur/Core/BaseApi.dart';
import 'package:bourboneur/Core/Controllers/BlueBooks.dart';
import 'package:bourboneur/Core/Controllers/Collection.dart';
import 'package:bourboneur/Core/Controllers/LastUpdate.dart';
import 'package:get/get.dart';

enum CollectionType { wishlist, normal }

class _Collection extends BaseApi {

  static String COLLECTION_ADD = 'collection/add';
  static String COLLECTION_DELETE = 'collection/delete';
  static String COLLECTION_ALL = 'collection/all';
  static String COLLECTION_CHART_DATA = 'collection/chart-data';

  Future<dynamic> add(
    String bottleId,
    String? userId,
    Enum type
  ) async {
    
    var data = {
      "bottle_id": bottleId,
      "user_id": userId,
      "type": type.name
    };
    var response = await sendPost(COLLECTION_ADD, data);
    if (response == null ) return false;
    if ( response.body['code'] != 'OK' ) {
      utils.showToast("Error", response.body['data']);
      return false;
    }

    return;
  }

  Future<dynamic> remove(    
    String id
  ) async {
    
    var data = {
      "id": id
    };
    var response = await sendPost(COLLECTION_DELETE, data);
    if (response == null ) return false;
    if ( response.body['code'] != 'OK' ) {
      utils.showToast("Error", response.body['data']);
      return false;
    }

    return;
  }

  Future<dynamic> all(
    String userId,
    Enum type
  ) async {
    
    var data = {
      "user_id": userId,
      "type": type.name
    };
    var response = await sendGet(COLLECTION_ALL, query: data);
    if (response == null ) return false;
    if ( response.body['code'] != 'OK' ) {
      utils.showToast("Error", response.body['data']);
      return false;
    }

    List<Collection> cList = _parseCollection(response.body['data']);

    controller.collections.clear();
    controller.collections.addAll(cList);

    return cList.isNotEmpty;
  }

  Future<dynamic> getChartData(
    String userId
  ) async {
    
    var data = {
      "user_id": userId
    };
    var response = await sendGet(COLLECTION_CHART_DATA, query: data);
    if (response == null ) return false;
    if ( response.body['code'] != 'OK' ) {
      utils.showToast("Error", response.body['data']);
      return false;
    }

    return response.body['data'];
  }


  List<Collection> _parseCollection(List responseBody) {
    List<Collection> list = [];
    for( var item in responseBody )
    {
      list.add(Collection.fromJson(item));
    }

    return list;
  }

}

_Collection CollectionApi = Get.put(_Collection());
