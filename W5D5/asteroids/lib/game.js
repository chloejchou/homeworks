const Asteroid = require("./asteroid");

const DIM = {
  X: 1000,
  Y: 600,
  NUM_ASTEROIDS: 20
};

function Game() {
  this.DIM_X = DIM.X;
  this.DIM_Y = DIM.Y;
  this.NUM_ASTEROIDS = DIM.NUM_ASTEROIDS;
  this.asteroids = [];

  this.addAsteroids();
}

Game.prototype.randomPosition = function() {
  let x = Math.random() * this.DIM_X + 1;
  let y = Math.random() * this.DIM_Y + 1;
  return [x, y];
};

Game.prototype.addAsteroids = function() {
  for(let i = 0; i < this.NUM_ASTEROIDS; i++) {
    let ast = new Asteroid({pos: this.randomPosition()});
    this.asteroids.push(ast);
  }
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);

  this.asteroids.forEach((asteroid) => {
    asteroid.draw(ctx);
  });

};

Game.prototype.moveObjects = function() {
  this.asteroids.forEach((asteroid) => {
    asteroid.move();
  });
};

module.exports = Game;
