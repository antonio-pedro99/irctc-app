import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/controllers/login_control.dart';
import 'package:irctc_dbms/app/models/notification.dart';
import 'package:irctc_dbms/app/models/scoped/user.dart';
import 'package:irctc_dbms/app/models/user.dart';
import 'package:irctc_dbms/app/services/user.dart';
import 'package:irctc_dbms/app/views/elements/box_rectangle.dart';
import 'package:irctc_dbms/app/views/elements/rounded_button.dart';
import 'package:irctc_dbms/app/views/pages/login/login.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: primary,
            title: const Text("Your Notifications",
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
          body: model.isLogged()
              ? FutureBuilder<List<UserNotification>>(
                  future:
                      UserDataProvider.getUserNotifications(UserModel.logged!),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                          child: Text(
                              "Unabled to fetch data, check your internet"));
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            title: Text(snapshot.data![index].title!),
                            subtitle: Text(snapshot.data![index].content!),
                          );
                        }));
                  },
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
