/// <reference path="./global.d.ts" />
// @ts-check

/**
 * Implement the functions needed to solve the exercise here.
 * Do not forget to export them so they are available for the
 * tests. Here an example of the syntax as reminder:
 *
 * export function yourFunction(...) {
 *   ...
 * }
 */

export function cookingStatus(m){
    if(m===undefined){
        return 'You forgot to set the timer.';
    } else if(m===0){
        return 'Lasagna is done.';
    } else {
        return 'Not done, please wait.';
    }
}

export function preparationTime(layers, average){
    var avr = average || 2;
    var layers = layers.length;
    return layers * avr;    
}

export function quantities(layers){
    var noodles = 0;
    var sauce = 0;
    for(var i = 0; i < layers.length; i++){
        if(layers[i] === 'noodles'){
            noodles += 50;
        } else if(layers[i] === 'sauce'){
            sauce += 0.2;
        }
    }
    return {noodles: noodles, sauce: sauce};
}

export function addSecretIngredient(friendsList, myList){
    myList.push(friendsList[friendsList.length - 1].toLowerCase());
}

export function scaleRecipe(quantities, portions){
    portions=portions?portions/2:1;
    var newQuantities = {...quantities};
    for(var key in newQuantities){
        newQuantities[key] *= portions;
    }
    
    return newQuantities;
}
