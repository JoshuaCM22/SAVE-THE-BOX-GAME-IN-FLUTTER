import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final me = Hero(
      tag: '',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/me.jpg'),
        ),
      ),
    );

    final titleText = Padding(
      padding: EdgeInsets.all(5),
      child: Text(
        'ABOUT',
        style: TextStyle(
            fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );

    final descriptionText = Padding(
      padding: EdgeInsets.all(0),
      child: Text(
        'Hi, I am Joshua C. Magoliman. The developer of this game.',
        style: TextStyle(fontSize: 17.0, color: Colors.white),
      ),
    );

    final backButton = Padding(
        padding: EdgeInsets.all(20),
        child: RaisedButton(
          color: Colors.black,
          child: Text('BACK', style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.pop(context);
          },
        ));

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(45.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.blue,
        ]),
      ),
      child: Column(
        children: <Widget>[
          me,
          titleText,
          descriptionText,
          backButton,
        ],
      ),
    );

    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: body,
      ),
    );
  }
}
