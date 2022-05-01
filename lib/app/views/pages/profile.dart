import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/models/scoped/user.dart';
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
      return NestedScrollView(
          headerSliverBuilder: ((context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: primary,
                elevation: 0,
                expandedHeight: 150,
                collapsedHeight: 100,
                systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.light,
                    statusBarBrightness: Brightness.light,
                    statusBarColor: primary30),
                floating: false,
                snap: false,
                actions: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          model.makelogout();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) {
                            return const LoginPage();
                          }), (value) => false);
                        });
                      },
                      icon: const Icon(Icons.tv_off_outlined))
                ],
                flexibleSpace: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height: 20),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: primary,
                      ),
                    ),
                    Text(
                      model.isLogged()
                          ? "${UserModel.userData["name"]}"
                          : "Your name after log in",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Text(
                      model.isLogged()
                          ? "${UserModel.userData["email"]}"
                          : "Your username after log in",
                      style: const TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ],
                ),
              )
            ];
          }),
          body: model.isLogged()
              ? ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  children: [
                    const Text(
                      "Account info",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black54),
                    ),
                    const SizedBox(height: 5),
                    BoxRectangle(
                        title: "",
                        //height: 125,
                        color: Colors.white,
                        body: ListTile(
                          leading: const Icon(Icons.person),
                          title: const Text(
                            "Name",
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Text("${UserModel.userData["name"]}"),
                          trailing: InkWell(
                            onTap: () {
                              setState(() {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Edit your name"),
                                        content: SizedBox(
                                          height: 100,
                                          child: Column(
                                            children: [
                                              TextField(
                                                onSubmitted: (value) {
                                                  model.updateName(value);
                                                  Navigator.of(context).pop();
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: "New name",
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        contentTextStyle: const TextStyle(),
                                      );
                                    });
                              });
                            },
                            child: const Icon(
                              Icons.edit,
                              size: 25,
                              color: primary,
                            ),
                          ),
                        )),
                    BoxRectangle(
                        title: "",
                        //height: 125,
                        color: Colors.white,
                        body: ListTile(
                          leading: const Icon(Icons.phone),
                          title: const Text(
                            "Phone",
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Text("${UserModel.userData["phone"]}"),
                          trailing: InkWell(
                            onTap: () {
                              setState(() {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Edit your Phone"),
                                        content: SizedBox(
                                          height: 100,
                                          child: Column(
                                            children: [
                                              TextField(
                                                onSubmitted: (value) {
                                                  model.updatePhone(value);
                                                  Navigator.of(context).pop();
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: "New phone",
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        contentTextStyle: const TextStyle(),
                                      );
                                    });
                              });
                            },
                            child: const Icon(
                              Icons.edit,
                              size: 25,
                              color: primary,
                            ),
                          ),
                        )),
                    BoxRectangle(
                        title: "",
                        //height: 125,
                        color: Colors.white,
                        body: ListTile(
                          leading: const Icon(Icons.email),
                          title: const Text(
                            "Email",
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Text("${UserModel.userData["email"]}"),
                          trailing: InkWell(
                            onTap: () {
                              setState(() {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Edit your Email"),
                                        content: SizedBox(
                                          height: 100,
                                          child: Column(
                                            children: [
                                              TextField(
                                                onSubmitted: (value) {
                                                  model.updateEmail(value);
                                                  Navigator.of(context).pop();
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: "New email",
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        contentTextStyle: const TextStyle(),
                                      );
                                    });
                              });
                            },
                            child: const Icon(
                              Icons.edit,
                              size: 25,
                              color: primary,
                            ),
                          ),
                        )),
                    BoxRectangle(
                        title: "",
                        //height: 125,
                        color: Colors.white,
                        body: ListTile(
                          leading: const Icon(Icons.calendar_month),
                          title: const Text(
                            "Age",
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Text("${UserModel.userData["age"]}"),
                          trailing: InkWell(
                            onTap: () {
                              setState(() {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Edit your age"),
                                        content: SizedBox(
                                          height: 100,
                                          child: Column(
                                            children: [
                                              TextField(
                                                onSubmitted: (value) {
                                                  model.updateAge(
                                                      int.parse(value));
                                                  Navigator.of(context).pop();
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: "New age",
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        contentTextStyle: const TextStyle(),
                                      );
                                    });
                              });
                            },
                            child: const Icon(
                              Icons.edit,
                              size: 25,
                              color: primary,
                            ),
                          ),
                        )),
                    const SizedBox(height: 5),
                    const Text(
                      "Security",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black54),
                    ),
                    const SizedBox(height: 5),
                    BoxRectangle(
                        title: "",
                        //height: 125,
                        color: Colors.white,
                        body: ListTile(
                          leading: const Icon(Icons.lock),
                          title: const Text(
                            "Change Password",
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Text("*" *
                              (UserModel.userData["name"] as String).length),
                          trailing: InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.edit,
                              size: 25,
                              color: primary,
                            ),
                          ),
                        ))
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
/*  Scaffold(
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
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const LoginPage();
                      }));
                    });
                  },
                  icon: const Icon(Icons.add_location_alt_outlined))
            ],
          ),
          body: model.isLogged()
              ? ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  children: [
                    BoxRectangle(
                      title: "",
                      //height: 125,
                      color: Colors.white,
                      body: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                backgroundColor: primary,
                                radius: 30,
                                child: Icon(
                                  Icons.person,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${UserModel.userData["name"]}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.edit,
                              size: 25,
                              color: primary,
                            ),
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
    }) */