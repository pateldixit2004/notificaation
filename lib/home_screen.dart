import 'package:flutter/material.dart';
import 'package:notificaation/noti.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List list = List.generate(20, (index) => 'Item $index');
  ScrollController controller = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(scroller);
  }

  void scroller() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      load_data();
    }
  }

  void load_data() {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      Future.delayed(
        Duration(seconds: 5),
        () {
          setState(() {
            list.addAll(List.generate(
                10, (index) => 'New List ${list.length + index}'));
            isLoading = false;
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  if (index < list.length) {
                    return ListTile(
                      title: Text(list[index]),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
                controller: controller,
                itemCount: list.length + 1,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  NotificationHelper.notificationHelper.showSimpleNotifiction();
                  print("////////////////////////////////");
                },
                child: Text("Noti")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  await NotificationHelper.notificationHelper.timerNotif();
                  print("////////////////////////////////");
                },
                child: Text("Time")),
            ElevatedButton(
                onPressed: () {
                  NotificationHelper.notificationHelper.timeNotification();
                  print("////////////////////////////////");
                },
                child: Text("Time")),
          ],
        ),
      ),
    ));
  }
}
