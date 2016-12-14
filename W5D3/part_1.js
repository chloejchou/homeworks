function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// 'in block' x 2


function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// 'in block', 'out of block'

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// error, var has a function scope

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// 'in block', 'out of block'

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

// error

// madLib
function madLib(verb, adjective, noun) {
  console.log(`We shall ${verb} the ${adjective} ${noun}`);
}

// isSubstring
function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

// fizzBuzz
function fizzBuzz(array) {
  var arr = [];
  array.forEach(function(el) {
    if (el % 3 === 0 && el % 5 !== 0) {
      arr.push(el);
    } else if (el % 3 !== 0 && el % 5 === 0) {
      arr.push(el);
    }
  });

  return arr;
}

// isPrime
function isPrime(number) {
  let prime = true;
  for (let i = 2; i < number; i++) {
    if (number % i === 0) {
      prime = false;
    }
  }
  return prime;
}

// sumOfNPrimes, returns the sum of the first n prime numbers
function sumOfNPrimes(number) {
  let sum = 0;
  let numPrimes = 0;
  let n = 2;
  while (numPrimes < number) {
    if (isPrime(n)) {
      numPrimes += 1;
      sum += n;
    }
    n += 1;
  }
  return sum;
}

// allOrNothing
function allOrNothing(mod) {
  let divisible = true;
  for (let i = 0; i < arguments.length; i++) {
    if (arguments[i] % mod !== 0) {
      divisible = false;
    }
  }
  return divisible;
}
