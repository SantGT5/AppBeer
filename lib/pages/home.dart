// import 'package:appbeer/controller/beer_api_controller.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        shadowColor: Colors.transparent,
        title: const Text("Mi title"),
        titleTextStyle: TextStyle(color: Colors.black),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("user name"),
                accountEmail: Text("user name"),
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
              onTap: () {},
            )
          ],
        ),
      ),
    );

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
