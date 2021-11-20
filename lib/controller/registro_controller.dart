import 'package:get/state_manager.dart';

class RegistroController extends GetxController {
  RxString correo = "".obs;
  RxString contrasena = "".obs;
  RxString contrasenaEye = "true".obs;
  RxBool checkBox = false.obs;

  void controllerCorreo(content) {
    correo.value = content;
  }

  void controllerContrasena(content) {
    contrasena.value = content;
  }

  void controllerEye() {
    contrasenaEye.value == "true"
        ? contrasenaEye.value = "false"
        : contrasenaEye.value = "true";
  }

  void controllerCheckBox(content) {
    checkBox.value == false ? checkBox.value = true : checkBox.value = false;
  }
}
