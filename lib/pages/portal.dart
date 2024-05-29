import 'package:bourboneur/Core/Apis/User.dart';
import 'package:bourboneur/Core/Controller.dart';
import 'package:bourboneur/Core/Utils.dart';
import 'package:bourboneur/pages/dashboard.dart';
import 'package:bourboneur/pages/page_helpers/open_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PortalPage extends StatefulWidget {
  const PortalPage({super.key});

  @override
  State<PortalPage> createState() => _PortalPageState();
}

class _PortalPageState extends State<PortalPage> {
  Utils utils = Utils();
  Controller controller = Get.find<Controller>();
  WebViewController webViewController = WebViewController();
  bool isLoading = true;

  @override
  void initState() {
    String url = "${controller.config.value.portalUrl}?customer_id=${controller.user.value.customerId}";

    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.black)
      ..addJavaScriptChannel('Application', onMessageReceived: (JavaScriptMessage msg) async {
        if ( msg.message == 'CLOSE' ) {
          await UserApi.getById(controller.user.value.id!);
          Get.off(() => openDashboard(controller.user.value));          
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
            setState(() {
              isLoading = false;
            });
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
    return !isLoading ? SafeArea(
      child: Scaffold(
        body: WebViewWidget(
          controller: webViewController
        ),
      ),
    ) : const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color:  Color(0xFFff8202),
        ),
      ),
    );
  }
}