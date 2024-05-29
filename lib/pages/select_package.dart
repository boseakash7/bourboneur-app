import 'dart:ffi';

import 'package:bourboneur/Core/Apis/Package.dart';
import 'package:bourboneur/Core/Controller.dart';
import 'package:bourboneur/Core/Controllers/Package.dart';
import 'package:bourboneur/common/custom_button.dart';
import 'package:bourboneur/pages/capture_payment_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectPackagePage extends StatefulWidget {
  const SelectPackagePage({super.key});

  @override
  State<SelectPackagePage> createState() => _SelectPackagePageState();
}

class _SelectPackagePageState extends State<SelectPackagePage> {
  Controller controller = Get.find<Controller>();

  bool isLoading = true;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });
    await PackageApi.all();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return !isLoading
        ? SafeArea(
            child: Scaffold(
                body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Select a Package,",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: Colors.white)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Please select a package, then enter your payment details",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.white)),
                    const SizedBox(
                      height: 10,
                    ),
                    if ( controller.user.value.packageId == null )
                    Text(
                        "You will not be charged, until trial is over. After that your normal package price is active",
                        textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: const Color(0xffe07e2f))),
                    const SizedBox(
                      height: 50,
                    ),
                  ]..addAll(_preparePackages(controller.packages)),
                ),
              ),
            )),
          )
        : const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Color(0xFFff8202),
              ),
            ),
          );
  }

  List<Widget> _preparePackages(RxList<Package> result) {
    if (isLoading) return [];

    List<Widget> list = [];
    bool trialAvailable = controller.user.value.packageId == null;
    for (Package package in result.value) {
      list.add(PackageItem(
        package: package,
        trialAvailable: trialAvailable,
      ));
    }

    return list;
  }
}

class PackageItem extends StatelessWidget {
  PackageItem({
    super.key,
    required this.package,
    required this.trialAvailable,
  });

  Package package;
  bool trialAvailable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.off(() => CapturePaymentDetails(
          packageId: package.id!,
          trialAvailable: trialAvailable,
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            // color: Color(0xFFff8202),
            border: Border.all(
              color: const Color(0xFFff8202),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(package.name!,
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontSize: 22)),
                const Spacer(),
                Text(
                    '\$' +
                        package.price! +
                        ' / ' +
                        (package.packageType == "yearly" ? "Year" : "Month"),
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.white, fontSize: 14)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            if ( trialAvailable )
            Row(
              children: [
                Text("7 days free trial available",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: const Color(0xFFff8202)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
