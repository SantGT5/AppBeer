import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  RxString correo = "".obs;
  RxString contrasena = "".obs;
  RxString contrasenaEye = "true".obs;

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
}
