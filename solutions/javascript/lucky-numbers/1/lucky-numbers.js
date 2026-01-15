// @ts-check

/**
 * Calculates the sum of the two input arrays.
 *
 * @param {number[]} array1
 * @param {number[]} array2
 * @returns {number} sum of the two arrays
 */
export function twoSum(array1, array2) {
  var sum = 0;
  var number1 = parseInt(array1.join(""));
  var number2 = parseInt(array2.join(""));
  sum = number1 + number2;
  return sum;
}

/**
 * Checks whether a number is a palindrome.
 *
 * @param {number} value
 * @returns {boolean} whether the number is a palindrome or not
 */
export function luckyNumber(value) {
  var number = value.toString();
  var reversed = number.split("").reverse().join("");
  return number === reversed;
}

/**
 * Determines the error message that should be shown to the user
 * for the given input value.
 *
 * @param {string|null|undefined} input
 * @returns {string} error message
 */
export function errorMessage(input) {
  if (input === '' || input === null || input === undefined) {
    return 'Required field';
  }
  if (isNaN(Number(input)) || Number(input) === 0) {
    return 'Must be a number besides 0';
  }

  return '';
}
