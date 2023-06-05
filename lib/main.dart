import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final tStyle = const TextStyle(
    fontSize: 50,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: CircleAvatar(
                maxRadius: 100,
                child: ClipOval(
                  child: Image.asset("assets/images/WorkPic.jpg"),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: const Text(
                  "Brandon Jedd Arius Jipiu",
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 50,
                  ),
                )
                    .animate()
                    .custom(
                      duration: 600.milliseconds,
                      begin: 2,
                      end: 0,
                      builder: (context, value, child) {
                        return RichText(
                          text: TextSpan(
                            children: "Brandon Jedd Arius Jipiu".split('').map((letter) {
                              return TextSpan(
                                style: const TextStyle(fontSize: 20.0),
                                children: [
                                  WidgetSpan(
                                    child: Transform.rotate(
                                      angle: value * -1, // Specify the rotation angle in radians
                                      child: Text(
                                        letter,
                                        style: tStyle,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        );
                      },
                    )
                    .slideX(begin: 5, curve: Curves.decelerate, duration: const Duration(milliseconds: 600))
                    .then()
                    .shimmer(duration: const Duration(seconds: 3)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // CustomAnimatedText(String s, {required TextStyle textStyle}) {

  // }
}
