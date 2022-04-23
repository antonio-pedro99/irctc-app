import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irctc_dbms/app/constants.dart';

class OTP1 extends StatelessWidget {
  const OTP1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController mobileNumController = TextEditingController();
    var formKey = GlobalKey<FormState>();

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
                    height: 15,
                  ),
                  TextFormField(
                    controller: mobileNumController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      prefixIcon: Icon(
                        Icons.phone,
                        size: 28,
                        color: Colors.white,
                      ),
                      hintText: "Enter you 10 digits number",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 18,
                          color: Colors.white54),
                    ),
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
                      child: const Text("Get OTP",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16))),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("or"),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Login with Email and Password",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      )
                    ],
                  )
                ])))
          ],
        ));
  }
}
