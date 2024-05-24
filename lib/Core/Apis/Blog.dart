import 'dart:async';

import 'package:bourboneur/Core/BaseApi.dart';
import 'package:bourboneur/Core/BlogController.dart';
import 'package:bourboneur/Core/Controllers/Blog.dart';
import 'package:get/get.dart';

class _Blog extends BaseApi {

  static String ALL = 'blogs/get-all-blogs';
  static String SEARCH = 'blogs/search-blog';
  static String GET_SINGLE = 'blogs/get-blog';

  BlogController _blogController = Get.find<BlogController>();

  Future<dynamic> all(
    int page
   ) async {
    
    var data = {
      "page": page.toString(),
      "limit": 11.toString()
    };
    var response = await sendGet(ALL, query: data);
    if (response == null ) return false;
    if ( response.body['code'] != 'OK' ) {
      utils.showToast("Error", response.body['data']);
      return false;
    }

    _blogController.totalItems = response.body['data']['total_items'].toString();
    _blogController.totalPages = response.body['data']['total_pages'].toString();
    _blogController.currentPage = response.body['data']['current_page'].toString();

    List<Blog> blogs = _parseBlog(response.body['data']['data']);
    
    _blogController.blogs.clear();
    _blogController.blogs.addAll(blogs);

    return true;
  }

  Future<dynamic> search(
    String keyword
  ) async {

    var data = {
      "keyword": keyword,
      "limit": 20.toString()
    };

    var response = await sendGet(SEARCH, query: data);
    if (response == null ) return false;
    if ( response.body['code'] != 'OK' ) {
      utils.showToast("Error", response.body['data']);
      return false;
    }

    List<Blog> blogs = _parseBlog(response.body['data']['data']);
    
    _blogController.searchBlogs.clear();
    _blogController.searchBlogs.addAll(blogs);

    return true;
  }

  Future<dynamic> getSingle(
    String id
  ) async {

    var data = {
      "blog_id": id
    };

    var response = await sendGet(GET_SINGLE, query: data);
    if (response == null ) return false;
    if ( response.body['code'] != 'OK' ) {
      utils.showToast("Error", response.body['data']);
      return false;
    }
    
    _blogController.blog.value = Blog.fromJson(response.body['data']['blog']);

    return true;
  }

    Future<dynamic> getRecent() async {
    
    var data = {
      "page": "1",
      "limit": "5"
    };
    var response = await sendGet(ALL, query: data);
    if (response == null ) return false;
    if ( response.body['code'] != 'OK' ) {
      utils.showToast("Error", response.body['data']);
      return false;
    }

    List<Blog> blogs = _parseBlog(response.body['data']['data']);
    
    _blogController.recentBlogs.clear();
    _blogController.recentBlogs.addAll(blogs);

    return true;
  }

  
  List<Blog> _parseBlog(List responseBody) {
    List<Blog> list = [];
    for( var item in responseBody )
    {
      list.add(Blog.fromJson(item));
    }

    return list;
  }



}

_Blog BlogApi = Get.put(_Blog());
