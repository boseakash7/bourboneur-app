import 'package:bourboneur/Core/Apis/User.dart';
import 'package:bourboneur/Core/Controller.dart';
import 'package:bourboneur/Core/Utils.dart';
import 'package:bourboneur/pages/dashboard.dart';
import 'package:bourboneur/pages/page_helpers/open_dashboard.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
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

    webViewController = WebViewController()
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
