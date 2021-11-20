import 'package:appbeer/controller/registro_controller.dart';
import 'package:appbeer/pages/login.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Registrar extends StatelessWidget {
  Registrar({Key? key}) : super(key: key);

  final RegistroController c = Get.put(RegistroController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            body: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 50, left: 83, right: 83),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                child: btnText("Login",
                                    Theme.of(context).textTheme.headline1),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                }),
                            GestureDetector(
                                child: btnText("Registrar",
                                    Theme.of(context).textTheme.headline1),
                                onTap: () {})
                          ],
                        ),
                      ),
                      const SizedBox(height: 67),
                      Container(
                          padding: const EdgeInsets.only(left: 30),
                          alignment: Alignment.centerLeft,
                          child: btnText("Registro",
                              Theme.of(context).textTheme.headline2)),
                      const SizedBox(height: 48),
                      Container(
                          padding: const EdgeInsets.only(left: 30),
                          alignment: Alignment.centerLeft,
                          child: btnText(
                              "Correo", Theme.of(context).textTheme.headline5)),
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
                            hintStyle: const TextStyle(
                                fontSize: 14, color: Colors.black),
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
                          child: btnText("Contraseña",
                              Theme.of(context).textTheme.headline5)),
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
                      const SizedBox(height: 22),
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 25,
                                  width: 30,
                                  child: Obx(() => Checkbox(
                                      checkColor: Colors.white,
                                      fillColor: MaterialStateProperty.all(
                                          Colors.black),
                                      value: c.checkBox.value,
                                      onChanged: (content) {
                                        c.controllerCheckBox(content);
                                      }))),
                              const SizedBox(width: 5),
                              Text(
                                "He Leído y accepto las condiciones de uso.",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ],
                          )),
                      const SizedBox(height: 230),
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
                              child: Text("CREAR CUENTA",
                                  style: Theme.of(context).textTheme.headline1),
                              onPressed: () {
                                print("Crear Cuenta");
                              }),
                        ),
                      )
                    ],
                  ),
                ))));
  }

  Widget btnText(String text, headline1) {
    return Text(
      text,
      style: headline1,
    );
  }
}
