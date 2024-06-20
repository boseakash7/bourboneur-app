import 'dart:math';

import 'package:bourboneur/Core/Apis/Auth.dart';
import 'package:bourboneur/Core/Controller.dart';
import 'package:bourboneur/Core/Utils.dart';
import 'package:bourboneur/common/custom_button.dart';
import 'package:bourboneur/common/custom_input.dart';
import 'package:bourboneur/common/login_wrapper.dart';
import 'package:bourboneur/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {

  bool isLoading = false;

  Controller controller = Get.find<Controller>();
  Utils utils = Utils();
  TextEditingController textEditingController = TextEditingController();

  int x = 0;
  int y = 0;

  @override
  void initState() {
    getRandomNumbers();
    super.initState();
  }

  getRandomNumbers() {
    x = Random().nextInt(10);
    y = Random().nextInt(10);
    setState(() {});
  }

  _handleDeleteAccount() async {
    if ( isLoading ) return;
    
    if ( textEditingController.value.text == "" ) {
      utils.showToast("Error", "Please enter the value first.");
      return;
    }

    int z = int.parse(textEditingController.value.text);
    if ( x + y != z ) {
      utils.showToast("Error", "Wrong value.");
      textEditingController.value = TextEditingValue();
      getRandomNumbers();
      return;
    }

    isLoading = true;
    setState(() {});

    // else submit
    await Auth.deleteAccount(controller.user.value.id!);
    await Auth.logout();

    Get.offAll(() => SignInPage());
  }

  @override
  Widget build(BuildContext context) {
    return LoginWrapper(
      child: SingleChildScrollView(
        child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
        child: Column(
          children: [
            const Text(
                "It's disheartening to know that you want to delete your Bourboneur account. It would be really helpful if you can please share the reason for the same at support@bourboneur.com, so that we can try to improve your experience.\n\nDeleting your Bourboneur account deletes all of the account information, including your personal information, ride history. Once account is deleted, you can not sign in to your account, and you won’t be able to access any data, content, or services that were associated with your Bourboneur account.\n\nDeleting your Bourboneur account is permanent. After your account is deleted, Bourboneur cannot reopen or reactivate your account or restore your data.  To create a new Bourboneur account , You will have to sign up again."),
                const SizedBox(
                  height: 20,
                ),
            CustomInput(
              label: "What is the value of $x + $y?",
              controller: textEditingController,
            ),
            const SizedBox(
                  height: 20,
                ),
            CustomButton(
              text: "Delete My Account",
              onTap: _handleDeleteAccount,
              isLoading: isLoading,
            )
          ],
        ),
      ),
      ),
    );
  }
}
