import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:SAVE_THE_BOX_GAME/game-logic/game_controller.dart';

class HighestscoreText {
  // Fields
  final GameController gameController;
  TextPainter painter;
  Offset position;

  // Constructor
  HighestscoreText(this.gameController) {
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    position = Offset.zero;
  }

// Start of User Defined Methods
  void render(Canvas paramCanvas) {
    int highscore = gameController.storage.getInt('highscore') ?? 0;
    painter.text = TextSpan(
      text: 'Highest Score: $highscore',
      style: TextStyle(
        color: Colors.blue,
        fontSize: 35,
        fontWeight: FontWeight.bold,
      ),
    );

    painter.layout();

    position = Offset(
      (gameController.screenSize.width / 2) - (painter.width / 2),
      (gameController.screenSize.height * 0.2) - (painter.height / 2),
    );

    painter.paint(paramCanvas, position);
  }

  void update(double paramValue) {
    // If there is no value , then set that value to 0
    int highscore = gameController.storage.getInt('highscore') ?? 0;
    painter.text = TextSpan(
      text: 'Highest Score: $highscore',
      style: TextStyle(
        color: Colors.blue,
        fontSize: 35,
        fontWeight: FontWeight.bold,
      ),
    );
    painter.layout();

    position = Offset(
      (gameController.screenSize.width / 2) - (painter.width / 2),
      (gameController.screenSize.height * 0.2) - (painter.height / 2),
    );
  }
  // End of User Defined Methods
}
