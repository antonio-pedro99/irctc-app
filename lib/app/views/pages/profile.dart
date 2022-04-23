import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/models/scoped/user.dart';
import 'package:irctc_dbms/app/models/ticket.dart';
import 'package:irctc_dbms/app/views/elements/box_rectangle.dart';
import 'package:irctc_dbms/app/views/elements/ticket_tile.dart';
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
          ),
          body: Column(
            children: [
              Container(
                  decoration: const BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 7,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: DefaultTextStyle(
                      style: const TextStyle(color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Expanded(
                  child: ListView(
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
              ))
            ],
          ));
    });
  }
}
