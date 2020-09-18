import 'package:SAVE_THE_BOX_GAME/instructions_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:SAVE_THE_BOX_GAME/about_page.dart';

class IntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleText = Padding(
      padding: EdgeInsets.all(0),
      child: Text(
        'Save the box',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );

    final logo = Hero(
      tag: '',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/blue_box.png'),
      ),
    );

    showAlertDialog(BuildContext context) {
      Widget noButton = FlatButton(
        child: Text("No"),
        onPressed: () {
          Navigator.pop(context);
        },
      );
      Widget yesButton = FlatButton(
        child: Text("Yes"),
        onPressed: () {
          SystemNavigator.pop();
        },
      );

      AlertDialog alert = AlertDialog(
        title: Text("Attention"),
        content: Text("Are you sure you want to exit?"),
        actions: [
          yesButton,
          noButton,
        ],
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    final startButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InstructionsPage(),
            ),
          );
        },
        padding: EdgeInsets.all(12),
        color: Colors.blue,
        child: Text('START', style: TextStyle(color: Colors.white)),
      ),
    );

    final aboutButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AboutPage(),
            ),
          );
        },
        padding: EdgeInsets.all(12),
        color: Colors.blue,
        child: Text('ABOUT', style: TextStyle(color: Colors.white)),
      ),
    );

    final exitButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          showAlertDialog(context);
        },
        padding: EdgeInsets.all(12),
        color: Colors.blue,
        child: Text('EXIT', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            titleText,
            logo,
            startButton,
            aboutButton,
            exitButton,
          ],
        ),
      ),
    );
  }
}
