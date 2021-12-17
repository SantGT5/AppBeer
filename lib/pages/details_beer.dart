import 'package:appbeer/models/beer.dart';
import 'package:flutter/material.dart';

class DetailsBeer extends StatelessWidget {
  final Beer beer;
  DetailsBeer({Key? key, required this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = beer.image_url!;
    String title = beer.name!;

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 40),
            child: SizedBox(
              height: 180,
              child: Image.network(url, fit: BoxFit.fitHeight),
            ),
          )
        ],
      ),
    );
  }
}
