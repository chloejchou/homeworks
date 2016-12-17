const Game = require("./game");
const GameView = require("./game_view");

document.addEventListener("DOMContentLoaded", function() {
  const ctx = document.getElementById("game-canvas").getContext("2d");

  const game = new Game();
  const gameView = new GameView(game, ctx);
  gameView.start();
});
