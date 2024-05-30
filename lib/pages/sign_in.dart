import 'package:bourboneur/Core/Apis/Auth.dart';
import 'package:bourboneur/Core/Apis/User.dart';
import 'package:bourboneur/Core/Controller.dart';
import 'package:bourboneur/Core/Utils.dart';
import 'package:bourboneur/common/custom_button.dart';
import 'package:bourboneur/common/custom_input.dart';
import 'package:bourboneur/pages/dashboard.dart';
import 'package:bourboneur/pages/forget_password.dart';
import 'package:bourboneur/pages/page_helpers/open_dashboard.dart';
import 'package:bourboneur/pages/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Controller controller = Get.find<Controller>();
  bool isLoading = false;
  bool isTryToLogin = false;

  Utils utils = Utils();

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  void initState() {    
    // _tryToLogin();
    super.initState();
  }

  void _handleSubmit() async {
    if ( isLoading ) return;
    setState(() {
      isLoading = true;
    });
    if (controllerEmail.value.text.trim() == "" ||
        controllerPassword.value.text == "") {
      setState(() {
        isLoading = false;
      });
      utils.showToast("Error", "Please fill the form.");
      return;
    }

    String email = controllerEmail.value.text;
    String password = controllerPassword.value.text;

    var response = await Auth.login(email, password);
    if (response == false) {
      setState(() {
        isLoading = false;
      });

      return;
    }

    Get.offAll(() => openDashboard(controller.user.value));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return !isTryToLogin ? SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("cheers,",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.white)),
              const SizedBox(
                height: 10,
              ),
              Text("sign in to continue!",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.white)),
              const SizedBox(
                height: 50,
              ),
              CustomInput(
                label: "Email ID",
                controller: controllerEmail,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInput(
                label: "Password",
                obscureText: true,
                controller: controllerPassword,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const ForgetPasswordPage());
                },
                child: Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    "Forgot Password?",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                text: "Log in",
                onTap: _handleSubmit,
                isLoading: isLoading,
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                alignment: Alignment.center,
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: "I want to be a bourboneur. ",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 12, color: Colors.white),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(() => RegisterPage());
                      },
                    text: "Sign Up",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: const Color(0xFFff8202), fontSize: 12),
                  ),
                ])),
              )
            ],
          ),
        ),
      )),
    ) : const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color:  Color(0xFFff8202),
        ),
      ),
    );
  }
}
