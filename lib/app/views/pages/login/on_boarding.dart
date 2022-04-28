import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irctc_dbms/app/app.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/models/scoped/user.dart';
import 'package:irctc_dbms/app/views/pages/home.dart';
import 'package:irctc_dbms/app/views/pages/login/opt_1.dart';
import 'package:scoped_model/scoped_model.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: swatch,
      body: ScopedModelDescendant<UserModel>(builder: (context, child, model) {
        return CustomScrollView(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                  const Text("Online Train Booking\n App",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28)),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                      "Find all local and intercity trips with our app This app was designed for educational purpose only, it is the final project for DBMS subject at IIITD. by Group No. 39",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white54,
                          fontWeight: FontWeight.w100,
                          fontSize: 16)),
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
                      onPressed: () {
                        if (!model.isLogged()) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) {
                            return const OTP1();
                          }), (route) => false);
                        } else {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) {
                            return const MyHome();
                          }), (route) => false);
                        }
                      },
                      child: const Text("Explore",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)))
                ])))
          ],
        );
      }),
    );
  }
}
