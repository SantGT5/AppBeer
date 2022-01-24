// import 'package:appbeer/controller/beer_api_controller.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:appbeer/controller/auth_controller.dart';
import 'package:appbeer/pages/profile.dart';
import 'package:appbeer/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          shadowColor: Colors.transparent,
          title: const Text("Mi title"),
          titleTextStyle: TextStyle(color: Colors.black),
          centerTitle: true,
        ),
        drawer: Obx(
          () => Drawer(
            child: Column(
              children: [
                if (authController.firestoreUser.value != null)
                  UserAccountsDrawerHeader(
                      accountName:
                          (authController.firestoreUser.value!.name != null
                              ? Text(
                                  authController.firestoreUser.value!.name!,
                                  style: textTheme.bodyText1,
                                )
                              : Container()),
                      accountEmail:
                          (authController.firestoreUser.value!.email != null
                              ? Text(authController.firestoreUser.value!.email!)
                              : Container()),
                      currentAccountPicture: CircleAvatar(
                        child: ClipRRect(
                          child: Image.asset("assets/image/accountPicture.png"),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      )),
                ListTile(
                  trailing: Icon(Icons.ac_unit_outlined),
                  title: Text(
                    "Destaques",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  trailing: Icon(Icons.ac_unit_outlined),
                  title: Text(
                    "Profile",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    Get.back();
                    Get.to(ProfilePage());
                  },
                )
              ],
            ),
          ),
        ));

    // GetBuilder<BeerAPIController>(
    //   init: BeerAPIController(),
    //   builder: (beerAPIController) => Scaffold(
    //       body: Obx(() => Column(
    //             children: [
    //               Center(
    //                 child: Text(beerAPIController.beers[1].yeast),
    //               )
    //             ],
    //           ))),
    // );
  }
}
