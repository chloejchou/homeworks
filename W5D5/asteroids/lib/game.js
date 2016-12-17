const Asteroid = require("./asteroid");

function Game() {
  this.DIM_X = 1000;
  this.DIM_Y = 600;
  this.NUM_ASTEROIDS = 20;
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
  // console.log(`addAsteroids: ${this.asteroids}`);
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
