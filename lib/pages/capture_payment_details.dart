import 'dart:io';

import 'package:bourboneur/Core/Apis/User.dart';
import 'package:bourboneur/Core/Controller.dart';
import 'package:bourboneur/Core/Utils.dart';
import 'package:bourboneur/pages/page_helpers/open_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CapturePaymentDetails extends StatefulWidget {
  CapturePaymentDetails({
    super.key,
    required this.packageId,
    required this.trialAvailable
  });

  String packageId;
  bool trialAvailable;

  @override
  State<CapturePaymentDetails> createState() => _CapturePaymentDetailsState();
}

class _CapturePaymentDetailsState extends State<CapturePaymentDetails> {
  Utils utils = Utils();
  Controller controller = Get.find<Controller>();
  WebViewController webViewController = WebViewController();

  @override
  void initState() {
    String url = widget.trialAvailable ? controller.config.value.saveCardUrl! : controller.config.value.subscribeNowUrl!;
    url = "${url}?user_id=${controller.user.value.id}&package_id=${widget.packageId}";

    String userAgent = Platform.isIOS ?
    'Mozilla/5.0 (iPhone; CPU iPhone OS 17_6_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1' :
    'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.6613.127 Mobile Safari/537.36';

    webViewController = WebViewController()
      ..setUserAgent(userAgent)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..addJavaScriptChannel('Application', onMessageReceived: (JavaScriptMessage msg) async {
        if ( msg.message == 'REDIRECT' ) {
          await UserApi.getById(controller.user.value.id!);
          Get.off(() => openDashboard(controller.user.value));
          utils.showToast("Success", "Your package has been activated, enjoy!");
        }
      })
      // ..
      ..setNavigationDelegate(
        NavigationDelegate(
          onHttpAuthRequest: (request) {
            print(request);
          },
          onProgress: (int progress) {
            // Update loading bar.
            print(progress);
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            print(url);
          },
          onHttpError: (HttpResponseError error) {
            print(error);
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(
          controller: webViewController
        ),
      ),
    );
  }
}
