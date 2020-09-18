import 'dart:ui';
import 'package:SAVE_THE_BOX_GAME/game-logic/game_controller.dart';

class Enemy {
  // Fields
  final GameController gameController;
  int health;
  int damage;
  double speed;
  Rect enemyRect;
  bool isDead = false;

  // Constructor
  Enemy(this.gameController, double x, double y) {
    health = 2;
    damage = 1;
    speed = gameController.tileSize * 2;
    // Set the location and size of the enemy
    enemyRect = Rect.fromLTWH(
      x,
      y,
      gameController.tileSize * 1.2,
      gameController.tileSize * 1.2,
    );
  }

// Start of User Defined Methods
  void render(Canvas paramCanvas) {
    Color color;
    switch (health) {
      case 1:
        color = Color(0xFFFF7F7F);
        break;
      case 2:
        color = Color(0xFFFF3636);
        break;
    }
    Paint enemyColor = Paint()..color = color;
    paramCanvas.drawRect(enemyRect, enemyColor);
  }

  void update(double paramValue) {
    // If enemy is not dead
    if (!isDead) {
      double stepDistance = speed * paramValue;
      Offset toPlayer =
          gameController.player.playerRect.center - enemyRect.center;
      // Set the distance of enemy, when enemy is collided of player
      if (stepDistance <= toPlayer.distance - gameController.tileSize * 1.25) {
        // Set the location of player
        Offset stepToPlayer =
            Offset.fromDirection(toPlayer.direction, stepDistance);
        // The built-in method called shift() make the enemy towards the location specified
        enemyRect = enemyRect.shift(stepToPlayer);
      } else {
        attack();
      }
    }
  }

  void attack() {
    // If player is not dead
    if (!gameController.player.isDead) {
      // Decrease the current health of player
      gameController.player.currentHealth -= damage;
    }
  }

  void onTapDown() {
    // If enemy is not dead
    if (!isDead) {
      // Decrease the health of enemy of player tapped the screen
      health--;
      // If enemy health is less than or equal to zero
      if (health <= 0) {
        isDead = true;
        gameController.score++;
        // If highscore is null set that value to 0
        if (gameController.score >
            (gameController.storage.getInt('highscore') ?? 0)) {
          // Set a new a high score
          gameController.storage.setInt('highscore', gameController.score);
        }
      }
    }
  }
  // End of User Defined Methods
}
