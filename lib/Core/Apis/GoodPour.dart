import 'dart:async';

import 'package:bourboneur/Core/BaseApi.dart';
import 'package:bourboneur/Core/Controllers/GoodPour.dart';
import 'package:get/get.dart';

class _GoodPour extends BaseApi {

  static String BY_LOCATION = 'goodpour/search-goodpour';

  Future<dynamic> all(
    String location,
    String page,
    String limit
  ) async {
    
    var data = {
      "keyword": location,
      "page": page,
      "limit": limit
    };
    var response = await sendGet(BY_LOCATION, query: data);
    if (response == null ) return false;
    if ( response.body['code'] != 'OK' ) {
      utils.showToast("Error", response.body['data']);
      return false;
    }

    List<GoodPour> cList = _parseGoodPour(response.body['data']['data']);

    controller.goodpour.clear();
    controller.goodpour.addAll(cList);

    return true;
  }

  List<GoodPour> _parseGoodPour(List responseBody) {
    List<GoodPour> list = [];
    for( var item in responseBody )
    {
      list.add(GoodPour.fromJson(item));
    }

    return list;
  }

}

_GoodPour GoodPourApi = Get.put(_GoodPour());
