import 'package:bourboneur/pages/Explore/ExploreItem.dart';
import 'package:bourboneur/pages/explore.dart';
import 'package:flutter/material.dart';

class ExploreItemController {
  List<ExploreItem> exploreItems = [];

  VoidCallback? close;

  void dispose() {
    close = null;
  }

}
