import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irctc_dbms/app/app.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/views/pages/login/register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              toolbarHeight: 0,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.dark,
                  statusBarBrightness: Brightness.light,
                  statusBarColor: Colors.white),
            ),
            SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                sliver: SliverList(
                    delegate: SliverChildListDelegate([
                  const Text("Login",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 28)),
                  Image.asset(
                    "assets/ilustrations/logo.png",
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (str) {
                      if (str!.isEmpty) {
                        return "Invalid email";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Enter your email",
                        prefixIcon:
                            const Icon(Icons.email_sharp, color: primary),
                        fillColor: grey1,
                        filled: true,

                        // label: const Text("Email"),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(13))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (str) {
                      if (str!.isEmpty) {
                        return "password";
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter your Password",
                        prefixIcon:
                            const Icon(Icons.lock_open_sharp, color: primary),
                        fillColor: grey1,
                        filled: true,

                        // label: const Text("Email"),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(13))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                      style: ButtonStyle(
                          maximumSize: MaterialStateProperty.resolveWith(
                              (states) => const Size(200, 50)),
                          minimumSize: MaterialStateProperty.resolveWith(
                              (states) => const Size(170, 50)),
                          alignment: Alignment.center,
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => primary)),
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) {
                          return const MyHome();
                        }), (route) => false);
                      },
                      child: const Text("Login",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16))),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const RegisterPage();
                      }));
                    },
                    child: const Text(
                      "Don't have an account yet?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: primary),
                    ),
                  )
                ])))
          ],
        ));
  }
}
