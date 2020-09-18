import 'dart:ui';
import 'package:SAVE_THE_BOX_GAME/game-logic/game_controller.dart';

class Player {
  // Fields
  final GameController gameController;
  int maxHealth;
  int currentHealth;
  Rect playerRect;
  bool isDead = false;

  // Construtor
  Player(this.gameController) {
    maxHealth = currentHealth = 300;
    final size = gameController.tileSize * 1.5;
    // Set the player location in the center of the screen
    playerRect = Rect.fromLTWH(
      gameController.screenSize.width / 2 - size / 2,
      gameController.screenSize.height / 2 - size / 2,
      size,
      size,
    );
  }

// Start of User Defined Methods
  void render(Canvas paramCanvas) {
    Paint color = Paint()..color = Color(0xFF3498DB);
    paramCanvas.drawRect(playerRect, color);
  }

  void update(double paramValue) {
    if (!isDead && currentHealth <= 0) {
      isDead = true;
      gameController.initialize();
    }
  }
  // End of User Defined Methods
}
