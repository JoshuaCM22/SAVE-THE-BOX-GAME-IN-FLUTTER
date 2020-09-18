import 'package:SAVE_THE_BOX_GAME/game-logic/components/enemy.dart';
import 'package:SAVE_THE_BOX_GAME/game-logic/game_controller.dart';

class EnemySpawner {
  // Fields
  final GameController gameController;
  final int maxSpawnInterval = 3000;
  final int minSpawnInterval = 700;
  final int intervalChange = 3;
  final int maximumEnemies = 7;
  int currentInterval;
  int nextSpawn;

  // Constructor
  EnemySpawner(this.gameController) {
    initialize();
  }

// Start of User Defined Methods
  void initialize() {
    killAllEnemies();
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

  void killAllEnemies() {
    gameController.enemies.forEach((Enemy oneEnemy) => oneEnemy.isDead = true);
  }

  void update(double paramValue) {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (gameController.enemies.length < maximumEnemies && now >= nextSpawn) {
      gameController.spawnEnemy();
      if (currentInterval > minSpawnInterval) {
        currentInterval -= intervalChange;
        currentInterval -= (currentInterval * 0.1).toInt();
      }
      nextSpawn = now + currentInterval;
    }
  }
  // End of User Defined Methods
}
