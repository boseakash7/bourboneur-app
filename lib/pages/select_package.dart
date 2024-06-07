import 'dart:ffi';

import 'package:bourboneur/Core/Apis/Package.dart';
import 'package:bourboneur/Core/Controller.dart';
import 'package:bourboneur/Core/Controllers/Package.dart';
import 'package:bourboneur/Core/Utils.dart';
import 'package:bourboneur/common/custom_button.dart';
import 'package:bourboneur/pages/capture_payment_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
                    Text("get whiskey wise,",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontFamily: 'Arial')),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.user.value.packageId == null ?
                      "Start your 7-day free trial.  Cancel anytime." :
                      "Start your subscription now. Cancel anytime.",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 16, color: const Color(0xffbfbfbf))),
                    const SizedBox(
                      height: 10,
                    ),
                    PackageForm()
                    // if ( controller.user.value.packageId == null )
                    // Text(
                    //     "You will not be charged, until trial is over. After that your normal package price is active",
                    //     textAlign: TextAlign.left,
                    //     style: Theme.of(context)
                    //         .textTheme
                    //         .bodySmall
                    //         ?.copyWith(color: const Color(0xffe07e2f))),
                    // const SizedBox(
                    //   height: 50,
                    // ),
                  ],
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
}

class PackageForm extends StatefulWidget {
  const PackageForm({super.key});

  @override
  State<PackageForm> createState() => _PackageFormState();
}

class _PackageFormState extends State<PackageForm> {
  Controller controller = Get.find<Controller>();
  Utils utils = Utils();

  String? selectedPackageId;

  void _handleSubmit() {
    if ( selectedPackageId == null ) {
      utils.showToast("Error", "Select a package first.");
      return;
    }

    Get.off(() => CapturePaymentDetails(
      packageId: selectedPackageId!,
      trialAvailable: controller.user.value.packageId == null,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                "Save 30%",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Arial',
                      // fontWeight: FontWeight.normal
                    ),
              )),
              const Expanded(child: Spacer())
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: const BoxDecoration(
              color: Color(0xff716d6c),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: []..addAll(_preparePackages(controller.packages)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
          text: controller.user.value.packageId == null ? "Start free 1 week trial" : "Renew subscription",
          onTap: _handleSubmit,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          controller.user.value.packageId == null ?
          "After the trial period you’ll be charged based upon your preferences selected above." :
          "After subscription complete you’ll will now be charged based upon your preferences selected above.",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: const Color(0xffbfbfbf)),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [            
            GestureDetector(
              onTap: () async {
                await launchUrl(Uri.parse(controller.config.value.termsUrl!));
              },
              child: Text(
                "Terms of Use",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: const Color(0xffbfbfbf)),
              ),
            ),
             GestureDetector(
              onTap: () async {
                 await launchUrl(Uri.parse(controller.config.value.privacyUrl!));
              },
              child: Text(
                "Privacy Policy",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: const Color(0xffbfbfbf)),
              ),
            )
          ],
        )
      ],
    );
  }

  List<Widget> _preparePackages(RxList<Package> result) {
    List<Widget> list = [];
    bool trialAvailable = controller.user.value.packageId == null;
    for (Package package in result.value) {
      list.add(PackageItem(
        package: package,
        trialAvailable: trialAvailable,
        isSelected: package.id == selectedPackageId,
        onTap: (Package package) {
          setState(() {
            selectedPackageId = package.id;
          });
          //  Get.off(() => CapturePaymentDetails(
          //     packageId: package.id!,
          //     trialAvailable: trialAvailable,
          //   ));
        },
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
    this.isSelected,
    this.onTap,
  });

  Package package;
  bool trialAvailable;
  bool? isSelected;
  void Function(Package)? onTap;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        if (onTap != null) onTap!(package);
      },
      child: Container(
        decoration: BoxDecoration(          
            border: Border.all(
                color: const Color(0xFFff8202)
                    .withOpacity(isSelected == true ? 1 : 0),
                width: 3),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        padding:
            const EdgeInsets.only(top: 15, bottom: 15, right: 10, left: 10),
        child: Column(
          children: [
            Text((package.packageType == "yearly" ? "yearly" : "monthly"),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.normal)),
            const SizedBox(
              height: 5,
            ),
            Text("\$${package.price}",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 26,
                      fontFamily: 'Arial',
                      // fontWeight: FontWeight.normal
                    )),
            if (trialAvailable)
              const SizedBox(
                height: 5,
              ),
            Text("7 day free trial",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.normal))
          ],
        ),
      ),
    );
  }
}
