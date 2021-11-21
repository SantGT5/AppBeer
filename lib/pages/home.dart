import 'package:appbeer/controller/beer_api_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BeerAPIController>(
      init: BeerAPIController(),
      builder: (beerAPIController) => Scaffold(
          body: Obx(() => Column(
                children: [
                  Center(
                    child: Text(beerAPIController.beers[1].yeast),
                  )
                ],
              ))),
    );
  }
}
