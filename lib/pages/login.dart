import 'package:appbeer/controller/auth_controller.dart';
import 'package:appbeer/global_widget/show_alert_dialog.dart';
import 'package:appbeer/global_widget/textfield_global.dart';
import 'package:appbeer/pages/home.dart';
import 'package:appbeer/utils/form_validator.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();

    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (authController) => Scaffold(
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 60),
                        Container(
                            padding: const EdgeInsets.only(left: 30),
                            alignment: Alignment.centerLeft,
                            child: const Text("Correo",
                                style: TextStyle(
                                  fontSize: 12,
                                ))),
                        const SizedBox(height: 7),
                        Container(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          width: double.infinity,
                          child: GlobalTextField(
                            obscureText: false,
                            hintText: "beer@ejemplo.com",
                            validator: FormValidator().isValidEmail,
                            keyboardType: TextInputType.emailAddress,
                            controller: authController.emailController,
                            maxLines: 1,
                            minLines: 1,
                            onSave: (value) =>
                                authController.emailController.text = value!,
                          ),
                        ),
                        const SizedBox(height: 25),
                        Container(
                            padding: const EdgeInsets.only(left: 30),
                            alignment: Alignment.centerLeft,
                            child: const Text("Contraseña",
                                style: TextStyle(
                                  fontSize: 12,
                                ))),
                        const SizedBox(height: 7),
                        Container(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          width: double.infinity,
                          child: Obx(
                            () => GlobalTextField(
                              suffixIcon: IconButton(
                                icon: Icon(
                                    authController.obscureTextPass.value == true
                                        ? Icons.remove_red_eye
                                        : Icons.remove_red_eye_outlined),
                                color: Colors.black,
                                onPressed: () {
                                  authController.obscureTextPass.value =
                                      !authController.obscureTextPass.value;
                                },
                              ),
                              obscureText: authController.obscureTextPass.value,
                              hintText: "Tu Contraseña",
                              validator: FormValidator().isValidPass,
                              keyboardType: TextInputType.text,
                              controller: authController.passController,
                              maxLines: 1,
                              minLines: 1,
                              onSave: (value) =>
                                  authController.passController.text = value!,
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          width: double.infinity,
                          child: Obx(
                            () => GlobalTextField(
                              suffixIcon: IconButton(
                                icon: Icon(authController
                                            .obscurePassConfirmation.value ==
                                        true
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined),
                                color: Colors.black,
                                onPressed: () {
                                  authController.obscurePassConfirmation.value =
                                      !authController
                                          .obscurePassConfirmation.value;
                                },
                              ),
                              obscureText:
                                  authController.obscurePassConfirmation.value,
                              hintText: "Tu Contraseña",
                              validator: FormValidator().isValidPass,
                              keyboardType: TextInputType.text,
                              controller: authController.passConfirmController,
                              maxLines: 1,
                              minLines: 1,
                              onSave: (value) => authController
                                  .passConfirmController.text = value!,
                            ),
                          ),
                        ),
                        // Image.asset("assets/image/thumbs_up.png"),
                        // const Icon(AppIcons.menu_icon),

                        const SizedBox(height: 46),
                        Container(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: SignInButton(
                              Buttons.Google,
                              text: "Login con Google",
                              onPressed: () {
                                // authController.signInAnonymous();
                                authController.signInGoogle();
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 180),
                        Container(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: TextButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color(0xFFFFB449))),
                                child: const Text("LOGIN",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                onPressed: () {
                                  if (authController
                                          .passConfirmController.text !=
                                      authController.passController.text) {
                                    showAlertDialog(context, "Error",
                                        "Las contraseñas no son iguales");
                                  } else if (_formKey.currentState!
                                      .validate()) {
                                    Get.to(Home());
                                    Get.snackbar(
                                      "Your data is correct",
                                      "Wellcome",
                                      icon: Icon(Icons.person,
                                          color: Colors.white),
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                    // ScaffoldMessenger.of(context)
                                    //     .showSnackBar(
                                    //   SnackBar(
                                    //     duration: Duration(seconds: 5),
                                    //     content:
                                    //         Text('Your data is correct'),
                                    //   ),
                                    // );
                                  }
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget btnText(String text, headline1) {
    return Text(
      text,
      style: headline1,
    );
  }
}
