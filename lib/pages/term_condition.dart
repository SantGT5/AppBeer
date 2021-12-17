import 'package:flutter/material.dart';

class TermCondition extends StatelessWidget {
  const TermCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Color(0xFF000000).withOpacity(0.5),
                  width: 2.0, // Underline thickness
                ))),
                padding: EdgeInsets.only(top: 50, right: 39, left: 39),
                child: Text(
                  "TERMINOS Y CONDICIONES",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
