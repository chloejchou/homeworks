const Game = require("./game");
const Asteroid = require("./asteroid");

function GameView(game, ctx) {
  this.game = game;
  this.ctx = ctx;
}

GameView.prototype.start = function() {
  setInterval(() => {
    this.game.draw(this.ctx);
    this.game.moveObjects();
  }, 20);
};

module.exports = GameView;
