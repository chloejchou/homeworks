function uniq(array) {
  let arr = [];
  array.forEach(function(el) {
    if (arr.indexOf(el) === -1) {
      arr.push(el);
    }
  });
  return arr;
}

// console.log(uniq([1,1,3,4,4]));

function twoSum(array) {
  let arr = [];
  for (let i = 0; i < array.length - 1; i++) {
    for (let j = i + 1; j < array.length; j++) {
      if (i !== j && array[i] + array[j] === 0) {
        arr.push([i,j]);
      }
    }
  }
  return uniq(arr);
}

// console.log(twoSum([1,1,3,4,52,-52,-1]));

function transpose(array) {
  let arr = [];
  let sub_arr = [];
  for (let j = 0; j < array[0].length; j++) {
    for (let i = 0; i < array.length; i++) {
      sub_arr.push(array[i][j]);
    }
    arr.push(sub_arr);
    sub_arr = [];
  }

  return arr;
}
//
// console.log(transpose([
//     [0, 1, 2],
//     [3, 4, 5]
//   ]));

Array.prototype.myEach = function(func) {
  for (let i = 0; i < this.length; i++) {
    func(this[i]);
  }
};

// console.log([1, 4, 3, 5, 6].myEach(function(el) {
//   console.log(el + 1);
// }));

Array.prototype.myMap = function(func) {
  let arr = [];
  this.myEach(function(el) {
    arr.push(func(el));
  });
  return arr;
};

// console.log([1, 2, 3, 4].myMap(function(el) {
//   return el + 7;
// }));

Array.prototype.myInject = function(func) {
  let result = this[0];

  this.slice(1).myEach(function(el) {
    result = func(result, el);
  });
  return result;
};


// console.log([6,2,5].myInject(function(result, el) {
//   return result % el;
// }));

Array.prototype.bubbleSort = function() {
  let arr = this.slice();
  let sorted = false;
  while (sorted === false) {
    sorted = true;
    for (let i = 0; i < arr.length - 1; i++) {
      for (let j = i + 1; j < arr.length; j++) {
        if (arr[i] > arr[j]) {
          let b = arr[j];
          arr[j] = arr[i];
          arr[i] = b;
          sorted = false;
        }
      }
    }
  }
  console.log(this);
  return arr;
};
// console.log([1,4,3,5,7,3, -1, -5].bubbleSort());


String.prototype.substrings = function() {
  let arr = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j <= this.length; j++) {
        arr.push(this.slice(i, j));
    }
  }
  return arr;
};

// console.log("Cat".substrings());

function range(start, end) {
  if (end < start) {
    return [];
  }
  return [start].concat(range(start + 1, end));
}

// console.log(range(1,7));

function exp1(b, n) {
  if (n===0) {
    return 1;
  }
  return b * exp1(b, n - 1);
}

// console.log(exp1(2, 5));

function exp2(b, n) {
  if (n===0) {
    return 1;
  }
  if (n % 2 === 0) {
    return Math.pow(exp2(b, n / 2), 2);
  } else {
    return b * Math.pow(exp2(b, (n - 1) / 2), 2);
  }
}

// console.log(exp2(2, 5));

function fibbonacci(n) {
  if (n === 2) {
    return [1, 1];
  } else if (n === 1) {
    return [1];
  } else if (n < 1) {
    return [];
  }

  let last = fibbonacci(n - 1)[n - 2] + fibbonacci(n - 2)[n - 3];
  return fibbonacci(n - 1).concat(last);
}

// console.log(fibbonacci(5));

function binary(array, target) {
  if (array.length === 1) {
    return 0;
  }
  let middleIndex = Math.floor(array.length / 2);
  let left = array.slice(0, middleIndex);
  let right = array.slice(middleIndex, array.length);
    if (target === array[middleIndex]) {
      return middleIndex;
  } else if (target < array[middleIndex]) {
      return binary(left, target);
  } else {
      return binary(right, target) + middleIndex;
  }
}

// console.log(binary([1, 2, 3, 4, 5, 6], 6));

function make_change(amount, coins = [25, 10, 5, 1]) {
  if ( amount === 0 ) {
    return [];
  }
  let bucket = [];
  let remainder = amount;

  for (let i = 0; i < coins.length; i++) {
    if (coins[i] <= amount) {
      bucket.push(coins[i]);
      remainder -= coins[i];
      break;
    }
  }

  return bucket.concat(make_change(remainder, coins));
}

// console.log(make_change(14, [10, 7, 1]));

function make_better_change(amount, coins = [25, 10, 5, 1]) {
  if ( amount === 0 ) {
    return [];
  }

  let bucket = make_change(amount, coins);
  let remainder;
  let tempBucket;

  for (let i = 1; i < coins.length; i++) {
    if (coins[i] > amount) {
      continue;
    }

    let coin = coins[i];
    remainder = amount - coin;
    tempBucket = [coin].concat(make_better_change(remainder, coins));
    if ( tempBucket.length < bucket.length ) {
      bucket = tempBucket;
    }
  }
  return bucket;
}
// console.log(make_better_change(14, [10, 7, 1]));

function merge_sort(array) {
  if (array.length <= 1) {
    return array;
  }
  let middleIndex = Math.floor(array.length / 2);
  let left = merge_sort(array.slice(0, middleIndex));
  let right = merge_sort(array.slice(middleIndex, array.length));

  return sort_helper(left, right);
}

function sort_helper(left, right) {
  let arr = [];

  while (left.length > 0 && right.length > 0) {
    if (left[0] <= right[0]) {
      arr.push(left[0]);
      left.shift();
    } else {
      arr.push(right[0]);
      right.shift();
    }
  }
  return arr.concat(left).concat(right);
}

// console.log(merge_sort([4, 32, 6, 8, 7, -100]));

function subsets(array) {
  if ( array.length === 0 ) {
    return [[]];
  }

  let result = subsets(array.slice(0, array.length - 1));
  let arr = [];

  let last = array[array.length - 1];
  result.myEach( (el) => arr.push(el.concat([last])) );

  //   function(el) {
  //   result.push(el.concat([last]));
  // }.bind(result));
  return result.concat(arr);
}

// console.log(subsets([1, 2, 3]));

function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cute = function() {
  return `${this.owner} loves ${this.name}`;
};

let c1 = new Cat("c1", "Nate");
let c2 = new Cat("cat 2", "Nate");
let c3 = new Cat("shaky", "Nate");
let c4 = new Cat("spot", "Nate");

Cat.prototype.meow = function() {
  return `${this.name} goes 'Meoww'`;
};

c3.meow = function() {
  return `${this.name} goes 'Woof'`;
};


// console.log(c3.meow());
// console.log(c3.name);

function Student(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.courses = [];
}

Student.prototype.name = function() {
  return this.firstName + " " + this.lastName;
};

Student.prototype.courses = function() {
  return this.courses;
};

Student.prototype.enroll = function(courseObj) {
  if (this.courses.indexOf(courseObj) === -1) {
    this.courses.forEach(function(course) {
      if (course.conflictsWith(courseObj)) {
        throw 'conflicting course';
      }
    });
    this.courses.push(courseObj);
    courseObj.enrolled_students.push(this);
  }
};

Student.prototype.courseLoad = function() {
  let hash = {};
  this.courses.forEach(function(course) {
    if (hash[course.department]) {
      hash[course.department] += course.credits;
    } else {
      hash[course.department] = course.credits;
    }
  });
  return hash;
};


function Course(name, department, credits, days, block) {
  this.name = name;
  this.department = department;
  this.credits = credits;
  this.days = days;
  this.block = block;
  this.enrolled_students = [];
}

Course.prototype.students = function() {
  return this.enrolled_students;
};

Course.prototype.addStudent = function(studentObj) {
  studentObj.enroll(this);
};

Course.prototype.conflictsWith = function(courseObj) {
  let that = this;
  that.days.forEach(function(day) {
    if (courseObj.days.indexOf(day) !== -1) {
      if (that.block === courseObj.block) {
        return true;
      }
    }
  });
  return false;
};

let nate = new Student("Nate", "X");
let nate2 = new Student("Nate2", "X");

let math = new Course('math101', 'math', 4, ['mon', 'tues'], 3);
let history = new Course('history101', 'history', 4, ['mon', 'tues'], 5);
let art = new Course('art5', 'art', 6, ['mon', 'wed'], 5);
let art0 = new Course('art0', 'art', 1, ['mon', 'tues'], 5);

console.log(art0.conflictsWith(art));

// nate.enroll(math);
// nate.enroll(history);
// nate2.enroll(art);
// nate2.enroll(art0);
//
// console.log(nate.courseLoad());
// console.log(nate2.courseLoad());
