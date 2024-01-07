
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationHelper
{
  static final NotificationHelper notificationHelper=NotificationHelper._();
  NotificationHelper._();
  FlutterLocalNotificationsPlugin notificationsPlugin=FlutterLocalNotificationsPlugin();
  Future<void> init()
  async {
    AndroidInitializationSettings androidInt=AndroidInitializationSettings('dal');
    DarwinInitializationSettings iosInt=DarwinInitializationSettings();
    InitializationSettings initializationSettings=InitializationSettings(android: androidInt,iOS: iosInt);
    tz.initializeTimeZones();
    await notificationsPlugin.initialize(initializationSettings);
  }

  void showSimpleNotifiction()
  {
    AndroidNotificationDetails androidShow=AndroidNotificationDetails('1', 'simple');
    DarwinNotificationDetails iosShow=DarwinNotificationDetails();
    NotificationDetails notificationDetails=NotificationDetails(android: androidShow,iOS: iosShow);
    notificationsPlugin.show(1,"Succes", "Add Product", notificationDetails);

  }



  // void timerNoti()
  // {
  //   AndroidNotificationDetails androidNoti=AndroidNotificationDetails("2", "Timer",priority: Priority.high,importance: Importance.max);
  //   DarwinNotificationDetails iosNoti=DarwinNotificationDetails();
  //   NotificationDetails notificationDetails=NotificationDetails(android: androidNoti,iOS: iosNoti);
  //   notificationsPlugin.zonedSchedule(2, "Time Testing", "Flutter", tz.TZDateTime.now(tz.local).add(Duration(minutes: 1)), notificationDetails, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
  //
  // }
  void timerNoti() {
    AndroidNotificationDetails androidNoti = const AndroidNotificationDetails(
      "2",
      "Timer",
      priority: Priority.high,
      importance: Importance.max,
      enableVibration: true,

    );

    DarwinNotificationDetails iosNoti = DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(android: androidNoti, iOS: iosNoti);

    notificationsPlugin.zonedSchedule(
      2,
      "Time Testing",
      "Flutter",
      tz.TZDateTime.now(tz.local).add(const Duration(minutes: 1)),
      notificationDetails,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> timerNotif()
  async {
    AndroidNotificationDetails androidNoti=AndroidNotificationDetails("2", "Timer",priority: Priority.high,importance: Importance.max);
    DarwinNotificationDetails iosNoti=DarwinNotificationDetails();
    NotificationDetails notificationDetails=NotificationDetails(android: androidNoti,iOS: iosNoti);
    await notificationsPlugin.zonedSchedule(2, "Time Testing", "Flutter", tz.TZDateTime.now(tz.local).add(Duration(seconds: 4)), notificationDetails, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
  }
  void timeNotification() {
    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('2', 'time',
        importance: Importance.high, priority: Priority.high);
    DarwinNotificationDetails iosdetail = DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        iOS: iosdetail, android: androidNotificationDetails);
    notificationsPlugin.zonedSchedule(
        1,
        "flutter notiication",
        "local time",
        tz.TZDateTime.now(tz.local).add(Duration(seconds: 3)),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);
  }
}