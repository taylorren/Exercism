// @ts-check
//
// The line above enables type checking for this file. Various IDEs interpret
// the @ts-check directive. It will give you helpful autocompletion when
// implementing this exercise.

//import { forEach } from "core-js/core/array";

/**
 * Determines how long it takes to prepare a certain juice.
 *
 * @param {string} name
 * @returns {number} time in minutes
 */
export function timeToMixJuice(name) {
  var timeSpent;
  switch (name) {
    case "Pure Strawberry Joy":
      timeSpent = 0.5;
      break;
    case "Energizer":
    case "Green Garden":
      timeSpent = 1.5;
      break;
    case "Tropical Island":
      timeSpent = 3;
      break;
    case "All or Nothing":
      timeSpent = 5;
      break;
    default:
      timeSpent = 2.5;
      break;
  }
  return timeSpent;
}

/**
 * Calculates the number of limes that need to be cut
 * to reach a certain supply.
 *
 * @param {number} wedgesNeeded
 * @param {string[]} limes
 * @returns {number} number of limes cut
 */
export function limesToCut(wedgesNeeded, limes) {
  var count = 0;
  if (wedgesNeeded === 0) {
    return 0;
  }
  for (let i = 0; i < limes.length; i++) {
    const lime = limes[i];
    if (lime === 'small') {
      wedgesNeeded -= 6;
    } else if (lime === 'medium') {
      wedgesNeeded -= 8;
    } else {
      wedgesNeeded -= 10;
    }
    count++;

    if (wedgesNeeded <= 0) {
      break; // Exit the loop if we have enough wedges
    }
  }

  return count;
}

/**
 * Determines which juices still need to be prepared after the end of the shift.
 *
 * @param {number} timeLeft
 * @param {string[]} orders
 * @returns {string[]} remaining orders after the time is up
 */
export function remainingOrders(timeLeft, orders) {
  const remaining = [];
  
  for (const order of orders) {
    const timeNeeded = timeToMixJuice(order); // Get the time needed for the current order
    
    if (timeLeft >0) {
      timeLeft -= timeNeeded; // Deduct the time spent on this order
    } else {
      remaining.push(order); // Add to remaining orders if time is insufficient
    }
  }
  
  return remaining; // Return the remaining orders
}
