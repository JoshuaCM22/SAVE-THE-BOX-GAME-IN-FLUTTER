import 'package:SAVE_THE_BOX_GAME/game-logic/game_controller.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InstructionsPage extends StatelessWidget {
  void showGamePage() async {
    WidgetsFlutterBinding.ensureInitialized();

    Util flameUtil = Util();
    await flameUtil.fullScreen();
    await flameUtil.setOrientation(DeviceOrientation.portraitUp);

    SharedPreferences storage = await SharedPreferences.getInstance();
    GameController gameController = GameController(storage);
    runApp(gameController.widget);

    TapGestureRecognizer tapper = TapGestureRecognizer();
    // If player tap the screen, then invoke this user defined method called onTapDown.
    tapper.onTapDown = gameController.onTapDown;
    // ignore: deprecated_member_use
    flameUtil.addGestureRecognizer(tapper);
  }

  @override
  Widget build(BuildContext context) {
    final instructionsTitleText = Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        'INSTRUCTIONS',
        style: TextStyle(
            fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );

    final instructionsDescriptionText = Padding(
      padding: EdgeInsets.all(0),
      child: Text(
        'Avoid to stick the other boxes in your blue box to prevent losing your life bar and when your life bar is gone, the game is over.',
        style: TextStyle(fontSize: 17.0, color: Colors.white),
      ),
    );

    final controlTitleText = Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        'CONTROL',
        style: TextStyle(
            fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );

    final controlDescriptionText = Padding(
      padding: EdgeInsets.all(0),
      child: Text(
        'Tap twice the other boxes to kill it.',
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

    final nextButton = Padding(
        padding: EdgeInsets.all(0),
        child: RaisedButton(
          color: Colors.black,
          child: Text('NEXT', style: TextStyle(color: Colors.white)),
          onPressed: () {
            showGamePage();

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     // builder: (context) => GamePage.startTheGame(),
            //     builder: (context) => GamePage(),
            //   ),
            // );
            // main();

            //   GamePage.showTheGamePage();

            // return Navigator.of(context).pushNamed(GamePage.startTheGame());
          },
        ));

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(50),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.blue,
        ]),
      ),
      child: Column(
        children: <Widget>[
          instructionsTitleText,
          instructionsDescriptionText,
          controlTitleText,
          controlDescriptionText,
          backButton,
          nextButton,
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
