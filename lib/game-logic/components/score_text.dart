import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:SAVE_THE_BOX_GAME/game-logic/game_controller.dart';

class ScoreText {
  // Fields
  final GameController gameController;
  TextPainter painter;
  Offset position;

  // Constructor
  ScoreText(this.gameController) {
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    position = Offset.zero;
  }

// Start of User Defined Methods
  void render(Canvas paramCanvas) {
    painter.paint(paramCanvas, position);
  }

  void update(double paramValue) {
    // Check if the text of painter is not equal to the old score, then update the score
    if ((painter.text ?? '') != gameController.score.toString()) {
      painter.text = TextSpan(
        text: gameController.score.toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 70.0,
        ),
      );
      painter.layout();

      position = Offset(
        (gameController.screenSize.width / 2) - (painter.width / 2),
        (gameController.screenSize.height * 0.2) - (painter.height / 2),
      );
    }
  }
  // End of User Defined Methods
}
