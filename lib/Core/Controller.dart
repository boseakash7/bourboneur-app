import 'package:bourboneur/Core/Controllers/BlueBooks.dart';
import 'package:bourboneur/Core/Controllers/Config.dart';
import 'package:bourboneur/Core/Controllers/GoodPour.dart';
import 'package:bourboneur/Core/Controllers/LastUpdate.dart';
import 'package:bourboneur/Core/Controllers/Package.dart';
import 'package:bourboneur/Core/Controllers/User.dart';
import 'package:bourboneur/Core/Controllers/WOD.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  Rx<User> user = User().obs;
  RxList<BlueBook> bluebooks = <BlueBook>[].obs;
  Rx<LastUpdate> lastUpdate = LastUpdate().obs;
  RxList<Package> packages = <Package>[].obs;
  RxList<GoodPour> goodpour = <GoodPour>[].obs;
  RxList<WOD> wods = <WOD>[].obs;
  Rx<WOD> wod = WOD().obs;
  Rx<Config> config = Config().obs;
}