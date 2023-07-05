import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'notification_service.dart';

class AppNotificationView extends StatefulWidget {
  const AppNotificationView({Key? key}) : super(key: key);

  @override
  State<AppNotificationView> createState() => AppNotificationViewState();
}

class AppNotificationViewState extends State<AppNotificationView> {
  initNotificationAll() {
    //terminate
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        if (message != null) {
          if (message.notification != null) {}
        }
      },
    );

    //foreground
    FirebaseMessaging.onMessage.listen(
      (message) {
        if (message.notification != null) {
          NotificationService.createanddisplaynotification(message);
        }
      },
    );

    //background
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        if (message.notification != null) {}
      },
    );
  }

  Future<String> getTokenz() async {
    String? token = await FirebaseMessaging.instance.getToken();

    return token ?? "";
  }

  @override
  void initState() {
    super.initState();
    initNotificationAll();
    getTokenz();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
