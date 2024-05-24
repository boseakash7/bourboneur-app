import 'package:bourboneur/Core/Apis/Auth.dart';
import 'package:bourboneur/Core/Utils.dart';
import 'package:bourboneur/common/custom_button.dart';
import 'package:bourboneur/common/custom_input.dart';
import 'package:bourboneur/pages/sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordPage extends StatefulWidget {
  ResetPasswordPage({
    super.key,
    required this.email
  });

  String email;

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {

  bool isLoading = false;

  TextEditingController otpController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  Utils utils = Utils();

  void _handleSubmit() async {
    if ( isLoading ) return;
    
    setState(() {
      isLoading = true;
    });
    if (otpController.value.text == "" ||
        password1Controller.value.text == "" ||
        password2Controller.value.text == "") {
      utils.showToast("Error", "Please fill the form.");
      setState(() {
        isLoading = false;
      });
      return;
    }

    String otp = otpController.value.text;    
    String password1 = password1Controller.value.text;
    String password2 = password2Controller.value.text;

    String email =  widget.email;

    if (!utils.isValidPassword(password1)) {
      utils.showToast("Error", "Password should be at least 8 character long.");
      setState(() {
        isLoading = false;
      });
      return;
    }

    if (password1 != password2 ) {
      utils.showToast("Error", "Password does not match");
      setState(() {
        isLoading = false;
      });
      return;
    }

    bool response = await Auth.resetPassword(email, password1, otp);
    if ( response ) {
      setState(() {
        isLoading = false;
      });
      Get.offAll(() => SignInPage());
      utils.showToast("Success", "Your password has been changed successfully.");
    }else {
      setState(() {
        isLoading = false;
      });
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Reset password,",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.white)),
                const SizedBox(
                  height: 10,
                ),
                Text("Enter otp received on your email",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white)),
                const SizedBox(
                  height: 50,
                ),
                CustomInput(
                  controller: otpController,
                  label: "OTP",                 
                ),
                
                const SizedBox(
                  height: 20,
                ),
                CustomInput(
                  controller: password1Controller,
                  label: "Password", 
                  obscureText: true,                
                ),                
                const SizedBox(
                  height: 20,
                ),
                 CustomInput(
                  controller: password2Controller,
                  label: "Retype Password",   
                  obscureText: true,              
                ),                
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: "Submit",
                  onTap: _handleSubmit,
                  isLoading: isLoading,
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "Remember Password? ",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 12, color: Colors.white),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.offAll(() => SignInPage());
                        },
                      text: "Sign In",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFFff8202), fontSize: 12),
                    ),
                  ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}