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

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// /// Flutter code sample for [Shortcuts].
//
// void main() => runApp(const ShortcutsExampleApp());
//
// class ShortcutsExampleApp extends StatelessWidget {
//   const ShortcutsExampleApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Shortcuts Sample')),
//         body: const Center(
//           child: ShortcutsExample(),
//         ),
//       ),
//     );
//   }
// }
//
// class IncrementIntent extends Intent {
//   const IncrementIntent();
// }
//
// class DecrementIntent extends Intent {
//   const DecrementIntent();
// }
//
// class ShortcutsExample extends StatefulWidget {
//   const ShortcutsExample({super.key});
//
//   @override
//   State<ShortcutsExample> createState() => _ShortcutsExampleState();
// }
//
// class _ShortcutsExampleState extends State<ShortcutsExample> {
//   int count = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Text("data"),
//             // TextField(),
//             Container(
//               height: 100,
//               width: 100,
//               color: Colors.purple,
//             ),
//             Shortcuts(
//               shortcuts: const <ShortcutActivator, Intent>{
//                 SingleActivator(LogicalKeyboardKey.keyA): IncrementIntent(),
//                 SingleActivator(LogicalKeyboardKey.arrowDown): DecrementIntent(),
//               },
//               child: Actions(
//                 actions: <Type, Action<Intent>>{
//                   IncrementIntent: CallbackAction<IncrementIntent>(
//                     onInvoke: (IncrementIntent intent) => setState(() {
//                       count = count + 1;
//                     }),
//                   ),
//                   DecrementIntent: CallbackAction<DecrementIntent>(
//                     onInvoke: (DecrementIntent intent) => setState(() {
//                       count = count - 1;
//                     }),
//                   ),
//                 },
//                 child: Focus(
//                   autofocus: true,
//                   child: Column(
//                     children: <Widget>[
//                       const Text('Add to the counter by pressing the up arrow key'),
//                       const Text(
//                           'Subtract from the counter by pressing the down arrow key'),
//                       Text('count: $count'),
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

List list = [1, 2, 3, 5];
List l1 = [];

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final currentCount = (MediaQuery.of(context).size.width ~/ 250).toInt();
    print("===============${currentCount}");

    final minCount = 4;
    return Scaffold(
      appBar: AppBar(
        title: Text('Keyboard Shortcut Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Type something...',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Press "A" to increment the counter:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: list.length,
            //     itemBuilder: (context, index) {
            //       return InkWell(
            //         onTap: () {
            //           setState(() {
            //             if (l1.contains(index)) {
            //               // If already selected, remove from l1
            //               l1.remove(index);
            //             } else if (l1.length < 3) {
            //               // If not selected and l1 length is less than 3, add to l1
            //               l1.add(index);
            //             }
            //           });
            //           print(l1.toString()); // Logging l1 for debugging
            //         },
            //         child: ListTile(
            //           title: Text("${list[index]}"),
            //           // Highlight the selected items
            //           tileColor: l1.contains(index)
            //               ? Colors.blue.withOpacity(0.3)
            //               : null,
            //         ),
            //       );
            //     },
            //   ),
            // ),
            Expanded(
                child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: min(currentCount, minCount),
                  childAspectRatio: 3/2,
                  mainAxisExtent: MediaQuery.of(context).size.width * 0.2,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 2),
              itemBuilder: (context, index) {
                return Container(
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.network(
                            "https://rukminim2.flixcart.com/image/416/416/ksxjs7k0/keyboard/desktop-keyboard/c/y/b/zeb-k20-zebronics-original-imag6dug5zssv72s.jpeg",
                          width: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text("data"),
                        Text("data+++"),
                      ],
                    ));
              },
              itemCount: 10,
            ))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Registering keyboard shortcuts
    RawKeyboard.instance.addListener(handleKey);
  }

  @override
  void dispose() {
    // Dispose the keyboard listener
    RawKeyboard.instance.removeListener(handleKey);
    super.dispose();
  }

  void handleKey(RawKeyEvent event) {
    // Check if the key pressed is "A" and if the focus is not on the TextField
    if (event is RawKeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.keyA &&
        !FocusScope.of(context).hasPrimaryFocus) {
      // Increment the counter
      setState(() {
        counter++;
      });
    }
  }
}
