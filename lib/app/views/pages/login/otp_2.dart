import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irctc_dbms/app/constants.dart';

class OTP2 extends StatelessWidget {
  const OTP2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: swatch,
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              toolbarHeight: 0,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarBrightness: Brightness.light,
                  statusBarColor: swatch),
            ),
            SliverPadding(
                padding: const EdgeInsets.all(12),
                sliver: SliverList(
                    delegate: SliverChildListDelegate([
                  Image.asset(
                    "assets/ilustrations/logo.png",
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Login",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28)),
                  const SizedBox(
                    height: 25,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextButton(
                      style: ButtonStyle(
                          maximumSize: MaterialStateProperty.resolveWith(
                              (states) => const Size(200, 50)),
                          minimumSize: MaterialStateProperty.resolveWith(
                              (states) => const Size(170, 50)),
                          alignment: Alignment.center,
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.white)),
                      onPressed: () {},
                      child: const Text("Submit",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)))
                ])))
          ],
        ));
  }
}
