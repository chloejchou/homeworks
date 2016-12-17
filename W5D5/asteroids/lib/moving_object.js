const Util = require("./utils");

function MovingObject(args) {
  this.pos = args['pos'];
  this.vel = args['vel'];
  this.radius = args['radius'];
  this.color = args['color'];
}

// draw a circle of appropriate radius centered at pos, fill with color
MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, false);
  ctx.fill();
};

// increment the pos by the vel
MovingObject.prototype.move = function() {
  let newX = this.pos[0] + this.vel[0];
  let newY = this.pos[1] + this.vel[1];
  this.pos[0] = Util.wrap(newX, 1000);
  this.pos[1] = Util.wrap(newY, 600);

  // this.pos[0] = this.pos[0] + this.vel[0];
  // this.pos[1] = this.pos[1] + this.vel[1];
};

module.exports = MovingObject;
