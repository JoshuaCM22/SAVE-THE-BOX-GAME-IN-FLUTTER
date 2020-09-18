import 'dart:ui';
import 'package:SAVE_THE_BOX_GAME/game-logic/game_controller.dart';

class HealthBar {
  // Fields
  final GameController gameController;
  Rect rectRemainingHealth;

  // Construtor
  HealthBar(this.gameController) {
    double barWidth = gameController.screenSize.width / 1.75;
    rectRemainingHealth = Rect.fromLTWH(
      gameController.screenSize.width / 2 - barWidth / 2,
      gameController.screenSize.height * 0.8,
      barWidth,
      gameController.tileSize * 0.5,
    );
  }

// Start of User Defined Methods
  void render(Canvas paramCanvas) {
    Paint remainingBarColor = Paint()..color = Color(0xFF3498DB);
    paramCanvas.drawRect(rectRemainingHealth, remainingBarColor);
  }

  void update(double paramValue) {
    double barWidth = gameController.screenSize.width / 1.75;
    double percentHealth =
        gameController.player.currentHealth / gameController.player.maxHealth;
    rectRemainingHealth = Rect.fromLTWH(
      gameController.screenSize.width / 2 - barWidth / 2,
      gameController.screenSize.height * 0.8,
      barWidth * percentHealth,
      gameController.tileSize * 0.5,
    );
  }
  // End of User Defined Methods
}
