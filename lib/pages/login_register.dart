import 'package:appbeer/pages/login.dart';
import 'package:appbeer/pages/registrar.dart';
import 'package:flutter/material.dart';

class LoginRegister extends StatelessWidget {
  const LoginRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                shadowColor: Colors.transparent,
                backgroundColor: Colors.white,
                title: TabBar(
                  labelPadding: const EdgeInsets.symmetric(horizontal: 28.0),
                  indicatorPadding:
                      const EdgeInsets.symmetric(horizontal: 20.0),
                  indicatorColor: const Color(0xFFFFB449),
                  indicatorWeight: 3,
                  isScrollable: true,
                  tabs: [
                    Tab(
                        icon: Text("Login",
                            style: Theme.of(context).textTheme.headline1)),
                    Tab(
                        icon: Text("Registrar",
                            style: Theme.of(context).textTheme.headline1)),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  Login(),
                  Registrar(),
                ],
              ),
            )));
  }
}
