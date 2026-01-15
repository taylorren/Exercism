//
// This is only a SKELETON file for the 'Pangram' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const isPangram = (sentence) => {
  const alphabet = 'abcdefghijklmnopqrstuvwxyz'.split('');
  const sentenceLower = sentence.toLowerCase();
  const sentenceArray = sentenceLower.split('');

  return alphabet.every((letter) => sentenceArray.includes(letter));
};
