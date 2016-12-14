// titleize

function titleize(nameArray, callback) {
  let titleizedArray = nameArray.map(function(name) {
    return `Mx. ${name} Jingleheimer Schmidt`;
  });
  titleizedArray.forEach(callback);
}

function printCallback(el) {
  console.log(el);
}

// elephants

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes phrRRRRRRRRRRR!!!!!!!`);
};

Elephant.prototype.grow = function() {
  this.height += 12;
};

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function() {
  let trick = this.tricks[Math.floor(Math.random()*this.tricks.length)];
  console.log(`${this.name} is ${trick}`);
};

Elephant.paradeHelper = function(elephant) {
  let trick = elephant.tricks[Math.floor(Math.random()*elephant.tricks.length)];
  console.log(`${elephant.name} is ${trick}`);
};

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

herd.forEach(Elephant.paradeHelper);

// closures

function dinerBreakfast() {
  let order = ["scrambled eggs and bacon"];
  return function(food) {
    order.push(food);
    console.log(order);
    console.log(food);
    console.log ("I'd like " + order.join(" and ") + " please.");
  };
}

let bfastOrder = dinerBreakfast(); // will equal the return function
// "I'd like cheesy scrambled eggs please"
bfastOrder("chocolate chip pancakes");
// "I'd like cheesy scrambled eggs and chocolate chip pancakes please."
bfastOrder("grits");
// "I'd like cheesy scrambled eggs and chocolate chip pancakes and grits please."
