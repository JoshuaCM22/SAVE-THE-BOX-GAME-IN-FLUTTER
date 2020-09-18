import 'package:flutter/material.dart';
import 'package:SAVE_THE_BOX_GAME/introduction_page.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Save the box',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
      ),
      initialRoute: 'introductionPage',
      routes: {
        'introductionPage': (context) => IntroductionPage(),
      },
    );
  }
}
