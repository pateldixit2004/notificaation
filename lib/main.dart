// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:notificaation/extra/extraFile.dart';
// import 'package:notificaation/home_screen.dart';
// import 'package:notificaation/noti.dart';
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   NotificationHelper.notificationHelper.init();
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ExtraFile(),
//     ),
//   );
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Keyboard Shortcuts Example',
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final textController = TextEditingController();
//   FocusNode focusNode = FocusNode();
//
//   bool showButton = false;
//   bool textButton = false;
//
//   @override
//   void initState() {
//     super.initState();
//     // Register the keyboard shortcuts
//     RawKeyboard.instance.addListener(_handleKeyEvent);
//   }
//
//   @override
//   void dispose() {
//     // Unregister the keyboard shortcuts
//     RawKeyboard.instance.removeListener(_handleKeyEvent);
//     super.dispose();
//   }
//
//   void _handleKeyEvent(RawKeyEvent event) {
//     if (event is RawKeyDownEvent) {
//       if (event.isAltPressed && event.logicalKey == LogicalKeyboardKey.keyA) {
//         setState(() {
//           showButton = true;
//         });
//       }
//     }
//     if (event is RawKeyDownEvent) {
//       if (event.isAltPressed && event.logicalKey == LogicalKeyboardKey.keyB) {
//         setState(() {
//           textButton = true;
//         });
//       }
//       if (event.character == "1" &&
//           event.logicalKey == LogicalKeyboardKey.keyB) {
//         setState(() {
//           showButton = true;
//         });
//       }
//     }
//   }
//  final controlC= SingleActivator(LogicalKeyboardKey.keyA,control: true)
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Keyboard Shortcuts Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Shortcuts(shortcuts: <ShortcutActivator,Intent>{
// controlC:CopyIntent();
//             }, child: Text("daat")),
//             TextField(
//               controller: textController,
//               focusNode: focusNode,
//               decoration: InputDecoration(
//                 labelText: 'Type something...',
//               ),
//             ),
//             SizedBox(height: 20),
//             if (showButton)
//               ElevatedButton(
//                 onPressed: () {
//                   // Your button action here
//                   print('Button Pressed!');
//                 },
//                 child: Text('Button'),
//               ),
//             if (textButton)
//               ElevatedButton(
//                   onPressed: () {
//                     showButton = false;
//                     setState(() {});
//                   },
//                   child: Text("Data"))
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CopyIntent extends Intent
// {
//
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Flutter code sample for [Shortcuts].

void main() => runApp(const ShortcutsExampleApp());

class ShortcutsExampleApp extends StatelessWidget {
  const ShortcutsExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Shortcuts Sample')),
        body: const Center(
          child: ShortcutsExample(),
        ),
      ),
    );
  }
}

class IncrementIntent extends Intent {
  const IncrementIntent();
}

class DecrementIntent extends Intent {
  const DecrementIntent();
}

class ShortcutsExample extends StatefulWidget {
  const ShortcutsExample({super.key});

  @override
  State<ShortcutsExample> createState() => _ShortcutsExampleState();
}

class _ShortcutsExampleState extends State<ShortcutsExample> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: const <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.keyA): IncrementIntent(),
        SingleActivator(LogicalKeyboardKey.arrowDown): DecrementIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          IncrementIntent: CallbackAction<IncrementIntent>(
            onInvoke: (IncrementIntent intent) => setState(() {
              count = count + 1;
            }),
          ),
          DecrementIntent: CallbackAction<DecrementIntent>(
            onInvoke: (DecrementIntent intent) => setState(() {
              count = count - 1;
            }),
          ),
        },
        child: Focus(
          autofocus: true,
          child: Column(
            children: <Widget>[
              const Text('Add to the counter by pressing the up arrow key'),
              const Text(
                  'Subtract from the counter by pressing the down arrow key'),
              Text('count: $count'),
            ],
          ),
        ),
      ),
    );
  }
}
