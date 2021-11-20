import 'package:appbeer/controller/login_controller.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final LoginController c = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Container(
              color: Colors.white,
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
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'beer@ejemplo.com',
                        hintStyle:
                            const TextStyle(fontSize: 14, color: Colors.black),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      onChanged: (content) {
                        c.controllerCorreo(content);
                      },
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
                      () => TextFormField(
                        obscureText:
                            c.contrasenaEye.value == "true" ? true : false,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(c.contrasenaEye.value == "true"
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined),
                            color: Colors.black,
                            onPressed: () {
                              c.controllerEye();
                            },
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Tu contraseña',
                          hintStyle: const TextStyle(
                              fontSize: 14, color: Colors.black),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        onChanged: (content) {
                          c.controllerContrasena(content);
                        },
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
                        onPressed: () {},
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
                            print("Crear Cuenta");
                          }),
                    ),
                  )
                ],
              ),
            )));
  }

  Widget btnText(String text, headline1) {
    return Text(
      text,
      style: headline1,
    );
  }
}
