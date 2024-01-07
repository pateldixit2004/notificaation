import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notificaation/home_screen.dart';
import 'package:notificaation/noti.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationHelper.notificationHelper.init();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
