import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irctc_dbms/app/app.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/models/user_register.dart';
import 'package:irctc_dbms/app/views/pages/login/login.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController fullnameController = TextEditingController();
    var globalKey = GlobalKey<FormState>();

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
                  const Text("Register",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 28)),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (str) {
                      if (str!.isEmpty) {
                        return "Invalid name";
                      }
                      return null;
                    },
                    controller: fullnameController,
                    decoration: InputDecoration(
                        hintText: "Enter your full name",
                        prefixIcon:
                            const Icon(Icons.person_sharp, color: primary),
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
                        return "Enter correct email";
                      }
                      return null;
                    },
                    controller: emailController,
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
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (str) {
                      if (str!.isEmpty) {
                        return "Enter correct number";
                      }
                      return null;
                    },
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: "Enter your number",
                        prefixIcon:
                            const Icon(Icons.phone_sharp, color: primary),
                        fillColor: grey1,
                        filled: true,

                        // label: const Text("Email"),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(13))),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (str) {
                      if (str!.isEmpty) {
                        return "Enter correct paramter";
                      }
                      return null;
                    },
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter your password",
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
                        if (globalKey.currentState!.validate()) {
                          UserRegister register = UserRegister(
                              name: fullnameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              password: passwordController.text);

                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const LoginPage();
                          }));
                        }
                      },
                      child: const Text("Register",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16))),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Already registered?",
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
