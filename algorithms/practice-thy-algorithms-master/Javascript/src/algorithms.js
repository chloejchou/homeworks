// (function () {
// if(typeof Algorithms === "undefined") {
//   window.Algorithms = {};
// }

// Write a method, digital_root(num).
// It should sum the digits of a positive integer.
// If it is greater than or equal to 10, sum the digits of the resulting number.
// Keep repeating until there is only one digit in the result, called the "digital root".
// Do not use string conversion within your method.
const digitalRoot = function (number) {
  if (number < 10) {
    return number;
  }
  let sum = 0;
  number.toString().split("").forEach(num => {
    sum += parseInt(num);
  });

  return digitalRoot(sum);
};

// console.log(digitalRoot(119));

// Write a function that takes a message and an increment amount and outputs the same letters shifted by that amount in the alphabet.
// Assume lowercase and no punctuation.
// Preserve spaces.
const caesarCipher = function (string, shift) {
  let answer = "";
  for (let i = 0; i < string.length; i++) {
    let newCharCode = (string.charCodeAt(i) + shift) % 123;
    if (newCharCode < 97) {
      newCharCode += 97;
    }
    answer += String.fromCharCode(newCharCode);
  }

  return answer;
};

// console.log(caesarCipher("xyz", 1));

// Write a function that takes two strings and returns the length of the longest common substring.
const commonSubstrings = function (stringOne, stringTwo) {
  let substring = "";
  for (let first = 0; first < stringOne.length; first++) {
    for (let last = first; last < stringOne.length; last++) {
      const currentSubstring = stringOne.slice(first, last + 1);
      if (substring.length < currentSubstring.length && stringTwo.includes(currentSubstring)) {
        substring = currentSubstring;
      }
    }
  }

  return substring;
};

// console.log(commonSubstrings("hello", "hell"));
// console.log(commonSubstrings("hellf", "hsdfsdf"));
// console.log(commonSubstrings("gat", "gcat"));

// Write a function that takes an array of integers and returns their sum.
// Use recursion.
const sumRec = function (numbers) {
  if (numbers.length === 1) {
    return numbers[0];
  }

  return numbers[0] + sumRec(numbers.slice(1));
};

// console.log(sumRec([1,2,3,4]));
// console.log(sumRec([1,2,3]));

// Write a function which returns the first n elements from the fibonnacci sequence, given n.
const fibs = function (number) {
  if (number === 0) {
    return [];
  } else if (number === 1) {
    return [1];
  } else if (number === 2) {
    return [1, 1];
  }

  const prevFib = fibs(number - 1);
  return prevFib.concat(prevFib[prevFib.length - 1] + prevFib[prevFib.length - 2]);
};

// console.log(fibs(7));

// Write a function that takes a string and returns true if it's a palindrome, false if it's not.
// Your solution should take less time and memory than rebuilding the string backward and comparing the two.
const isPalindrome = function (string) {
  let firstIdx = 0;
  let lastIdx = string.length - 1;
  for (firstIdx; firstIdx < string.length; firstIdx++) {
    if (string[firstIdx] !== string[lastIdx]) {
      return false;
    }
    lastIdx--;
  }

  return true;
};

// console.log(isPalindrome("racecar"));
// console.log(isPalindrome("hello"));

// Implement the Folding Cipher.
// It folds the alphabet in half and uses the adjacent letter.
// a <=> z, b <=> y, c <=> x, m <=> n.
const foldingCipher = function (string) {
  const alphabet = 'abcdefghijklmnopqrstuvwxyz'.split('');
  const reverseAlphabet = 'zyxwvutsrqponmlkjihgfedcba'.split('');
  const matches = {};
  for (let i = 0; i < alphabet.length; i++) {
    matches[alphabet[i]] = reverseAlphabet[i];
  }
  let answer = "";
  string.split("").forEach(letter => {
    answer += matches[letter];
  });

  return answer;
};

// console.log(foldingCipher("xyz"));
// console.log(foldingCipher("abc"));

// Write a method that finds all the unique substrings for a word.
const uniqSubs = function (string) {
  let subs = [];
  for(let startIdx = 0; startIdx < string.length; startIdx++) {
    for(let endIdx = startIdx; endIdx < string.length; endIdx++) {
      const currentSub = string.slice(startIdx, endIdx + 1);
      if (subs.indexOf(currentSub) === -1) {
        subs.push(currentSub);
      }
    }
  }
  return subs;
};

// console.log(uniqSubs("he"));
// console.log(uniqSubs("hel"));
// console.log(uniqSubs("hell"));


// Given an array of integers (positive and negative) find the largest contiguous subsum (sum of a subarray).
// You can solve this trivially in O(n**2) time by considering all subarrays.
// Try to solve it in O(n) time with O(1) memory.
const lcs = function (array) {
  let currentSum = 0;
  let maxSum = array[0];

  array.forEach(el => {
    currentSum += el;
    if (currentSum > maxSum) {
      maxSum = currentSum;
    }
    if (currentSum < 0) {
      currentSum = 0;
    }
  });

  return maxSum;
};

// Write a function that takes a year (four digit integer) and returns an array with the 10 closest subsequent years that meet the following condition:
// the first two digits summed with the last two digits are equal to the middle two digits.
const sillyYears = function (number) {
  let answer = [];
  for (number; answer.length < 10; number++) {
    const numArray = number.toString().split("");
    const sum = parseInt(numArray[0]) + parseInt(numArray[3]);
    if (sum === parseInt(numArray[1] + numArray[2])) {
      answer.push(number);
    }
  }

  return answer;
};

// console.log(sillyYears(1111));

// Given an array of integers, return all pairs that sum up to a specified value k.
// List the pairs in [min, max] order.
// Time complexity: O(n).
// Return an array.
const pairSum = function (array, k) {
  const answer = [];
  const seen = [];
  array.forEach(el => {
    const pair = k - el;
    if (seen.indexOf(pair) !== -1) {
      answer.push([el, pair].sort());
    }
    seen.push(el);
  });
  return answer;
};

// console.log(pairSum([1, 4, 5, -1, -5, 10, 3], 0));

// Given a matrix of integers and coordinates of a rectangular region within the matrix.
// Find the sum of numbers falling inside the rectangle.
// Time complexity: O(number of rows * number of columns).
const matrixRegionSum = function (matrix, topLeftCoords, bottomRightCoords) {
  let sum = 0;
  for (let row = topLeftCoords[0]; row <= bottomRightCoords[0]; row++) {
    for (let col = topLeftCoords[1]; col <= bottomRightCoords[1]; col++) {
      sum += matrix[row][col];
    }
  }

  return sum;
};

const matrix = [
  [1, 2, 3, 5],
  [4, 5, 6, 5],
  [7, 8, 9, 5]
];
console.log(matrixRegionSum(matrix,[1,1],[2,2]));

// })();
