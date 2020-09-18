import 'dart:math';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:SAVE_THE_BOX_GAME/game-logic/components/enemy.dart';
import 'package:SAVE_THE_BOX_GAME/game-logic/components/health_bar.dart';
import 'package:SAVE_THE_BOX_GAME/game-logic/components/highest_score_text.dart';
import 'package:SAVE_THE_BOX_GAME/game-logic/components/player.dart';
import 'package:SAVE_THE_BOX_GAME/game-logic/components/score_text.dart';
import 'package:SAVE_THE_BOX_GAME/game-logic/components/click_here_to_play_text.dart';
import 'package:SAVE_THE_BOX_GAME/game-logic/enemy_spawner.dart';
import 'package:SAVE_THE_BOX_GAME/game-logic/state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameController extends Game {
  // Fields
  final SharedPreferences storage;
  ScoreText scoreText;
  State state;
  HighestscoreText highestScoreText;
  ClickHereToPlayText clickHereToPlayText;
  Random randomNumber;
  EnemySpawner enemySpawner;
  HealthBar healthBar;
  Player player;
  Size screenSize;
  double tileSize;
  List<Enemy> enemies;
  int score;

  // Constructor
  GameController(this.storage) {
    initialize();
  }

//  Start of User Defined Methods copied from Class called Game
  void render(Canvas paramCanvas) {
    Rect background = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint backgroundPaint = Paint()..color = Color(0x000000);
    paramCanvas.drawRect(background, backgroundPaint);
    // Invoke this User Defined Method to show the box in the screen
    player.render(paramCanvas);
    if (state == State.menu) {
      highestScoreText.render(paramCanvas);
      clickHereToPlayText.render(paramCanvas);
    } else if (state == State.playing) {
      enemies.forEach((Enemy oneEnemy) => oneEnemy.render(paramCanvas));
      scoreText.render(paramCanvas);
      healthBar.render(paramCanvas);
    }
  }

  void update(double paramValue) {
    if (state == State.menu) {
      highestScoreText.update(paramValue);
      clickHereToPlayText.update(paramValue);
    } else if (state == State.playing) {
      enemySpawner.update(paramValue);
      enemies.forEach((Enemy oneEnemy) => oneEnemy.update(paramValue));
      enemies.removeWhere((Enemy oneEnemy) => oneEnemy.isDead);
      player.update(paramValue);
      scoreText.update(paramValue);
      healthBar.update(paramValue);
    }
  }

  void resize(Size paramSize) {
    screenSize = paramSize;
    tileSize = screenSize.width / 10;
  }
//  End of User Defined Methods copied from Class called Game

// Start of User Defined Methods
  void initialize() async {
    resize(await Flame.util.initialDimensions());
    state = State.menu;
    randomNumber = Random();
    player = Player(this);
    enemies = List<Enemy>();
    enemySpawner = EnemySpawner(this);
    healthBar = HealthBar(this);
    score = 0;
    scoreText = ScoreText(this);
    highestScoreText = HighestscoreText(this);
    clickHereToPlayText = ClickHereToPlayText(this);
  }

  // Player did tap the screen
  void onTapDown(TapDownDetails paramDetails) {
    if (state == State.menu) {
      state = State.playing;
    } else if (state == State.playing) {
      // Check if player tap the enemies
      enemies.forEach((Enemy oneEnemy) {
        if (oneEnemy.enemyRect.contains(paramDetails.globalPosition)) {
          oneEnemy.onTapDown();
        }
      });
    }
  }

  void spawnEnemy() {
    double x, y;
    switch (randomNumber.nextInt(4)) {
      case 0:
        // Top
        x = randomNumber.nextDouble() * screenSize.width;
        y = -tileSize * 2.5;
        break;
      case 1:
        // Right
        x = screenSize.width + tileSize * 2.5;
        y = randomNumber.nextDouble() * screenSize.height;
        break;
      case 2:
        // Bottom
        x = randomNumber.nextDouble() * screenSize.width;
        y = screenSize.height + tileSize * 2.5;
        break;
      case 3:
        // Left
        x = -tileSize * 2.5;
        y = randomNumber.nextDouble() * screenSize.height;
        break;
    }
    enemies.add(Enemy(this, x, y));
  }
  // End of User Defined Methods
}
