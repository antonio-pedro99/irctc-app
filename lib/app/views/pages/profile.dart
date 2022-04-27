import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/controllers/login_control.dart';
import 'package:irctc_dbms/app/models/scoped/user.dart';
import 'package:irctc_dbms/app/models/user.dart';
import 'package:irctc_dbms/app/services/user.dart';
import 'package:irctc_dbms/app/views/elements/box_rectangle.dart';
import 'package:irctc_dbms/app/views/elements/rounded_button.dart';
import 'package:irctc_dbms/app/views/pages/login/login.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: primary,
            title: const Text("My Profile",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                )),
            centerTitle: true,
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.light,
                statusBarColor: primary30),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      model.makelogout();
                    });
                  },
                  icon: Icon(Icons.add_location_alt_outlined))
            ],
          ),
          body: model.isLogged()
              ? ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  children: [
                    BoxRectangle(
                      title: "Save for control",
                      height: 125,
                      color: Colors.white,
                      body: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.print,
                                size: 25,
                                color: primary,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Print/Download",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.share,
                                size: 25,
                                color: primary,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Share",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () async {
                        /*  User user = await UserDataProvider.getUserDetails(
                            UserModel.logged!);

                        print(user.toJson()); */
                      },
                      child: BoxRectangle(
                        title: "Save for control",
                        height: 125,
                        color: Colors.white,
                        body: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.print,
                                  size: 25,
                                  color: primary,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Print/Download",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.share,
                                  size: 25,
                                  color: primary,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Share",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    BoxRectangle(
                      title: "Save for control",
                      height: 125,
                      color: Colors.white,
                      body: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.print,
                                size: 25,
                                color: primary,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Print/Download",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.share,
                                size: 25,
                                color: primary,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Share",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "You need to make login",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(height: 24),
                      RoundedButton(
                          label: "Login now",
                          labelColor: Colors.white,
                          onPress: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const LoginPage();
                            }));
                          })
                    ],
                  ),
                ));
    });
  }
}
