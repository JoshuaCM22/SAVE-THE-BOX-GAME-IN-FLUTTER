import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:SAVE_THE_BOX_GAME/game-logic/game_controller.dart';

class ClickHereToPlayText {
  // Fields
  final GameController gameController;
  TextPainter painter;
  Offset position;

  // Constructor
  ClickHereToPlayText(this.gameController) {
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    position = Offset.zero;
  }

// Start of User Defined Methods
  void render(Canvas paramCanvas) {
    painter.text = TextSpan(
      text: 'CLICK HERE TO PLAY',
      style: TextStyle(
        color: Colors.white,
        fontSize: 23,
      ),
    );

    painter.layout();

    position = Offset(
      (gameController.screenSize.width / 2) - (painter.width / 2),
      (gameController.screenSize.height * 0.7) - (painter.height / 2),
    );

    painter.paint(paramCanvas, position);
  }

  void update(double paramValue) {
    painter.text = TextSpan(
      text: 'CLICK HERE TO PLAY',
      style: TextStyle(
        color: Colors.white,
        fontSize: 23,
      ),
    );
    painter.layout();

    position = Offset(
      (gameController.screenSize.width / 2) - (painter.width / 2),
      (gameController.screenSize.height * 0.7) - (painter.height / 2),
    );
  }
  // End of User Defined Methods
}
