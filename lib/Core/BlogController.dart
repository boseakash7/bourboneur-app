import 'package:bourboneur/Core/Controllers/Blog.dart';
import 'package:bourboneur/Core/Controllers/BlueBooks.dart';
import 'package:bourboneur/Core/Controllers/GoodPour.dart';
import 'package:bourboneur/Core/Controllers/User.dart';
import 'package:bourboneur/Core/Controllers/WOD.dart';
import 'package:get/get.dart';

class BlogController extends GetxController {
  String? totalItems;
  String? currentPage;
  String? totalPages;  
  RxList<Blog> blogs = <Blog>[].obs;  
  RxList<Blog> searchBlogs = <Blog>[].obs;  
  Rx<Blog> blog = Blog().obs;
  RxList<Blog> recentBlogs = <Blog>[].obs;  
}