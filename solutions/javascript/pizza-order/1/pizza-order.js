/// <reference path="./global.d.ts" />
//
// @ts-check

/**
 * Determine the price of the pizza given the pizza and optional extras
 *
 * @param {Pizza} pizza name of the pizza to be made
 * @param {Extra[]} extras list of extras
 *
 * @returns {number} the price of the pizza
 */
export function pizzaPrice(pizza, ...extras) {
  var price=0;
  switch(pizza){
    case "Margherita":
      price=7;
      break;
    case "Formaggio":
      price=10;
      break;
    case "Caprese":
      price=9;
      break;
  }
  for(var i=0;i<extras.length;i++){
    switch(extras[i]){
      case "ExtraSauce":
        price+=1;
        break;
      case "ExtraToppings":
        price+=2;
        break;
    }
  }

  return price;
}

/**
 * Calculate the price of the total order, given individual orders
 *
 * (HINT: For this exercise, you can take a look at the supplied "global.d.ts" file
 * for a more info about the type definitions used)
 *
 * @param {PizzaOrder[]} pizzaOrders a list of pizza orders
 * @returns {number} the price of the total order
 */
export function orderPrice(pizzaOrders) {
  var price=0;
  for(var i=0;i<pizzaOrders.length;i++){
    price+=pizzaPrice(pizzaOrders[i].pizza,...pizzaOrders[i].extras);
  }
  return price;
}
