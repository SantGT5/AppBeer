import 'dart:convert';
import 'package:appbeer/models/beer_my_api.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import "package:get/get.dart";
import 'package:appbeer/models/beer.dart';
import "package:http/http.dart" as http;

class BeerAPIController extends GetxController {
  var JsonResult;

  final Rx<List<Beer>> _beersList = Rx<List<Beer>>([]);
  List<Beer> get beers => _beersList.value.obs;

  @override
  void onReady() {
    loadJson();
  }

  loadJson() async {
    try {
      String url = "https://api.punkapi.com/v2/beers";

      final data = await http.get(Uri.parse(url));

      JsonResult = data;
      _beersList.value = BeerAPI.fromJson(JsonResult).data;
    } catch (err) {
      print(err);
    }
    // String data = await rootBundle.loadString("assets/users.json");
  }
}
