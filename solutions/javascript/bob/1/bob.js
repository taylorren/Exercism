//
// This is only a SKELETON file for the 'Bob' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const hey = (message) => {
  const trimmedMessage = message.trim();

  if (trimmedMessage === '') {
    return 'Fine. Be that way!';
  }

  const isYelling = trimmedMessage === trimmedMessage.toUpperCase() && /[A-Z]/.test(trimmedMessage);
  const isQuestion = trimmedMessage.endsWith('?');

  if (isYelling && isQuestion) {
    return 'Calm down, I know what I\'m doing!';
  } else if (isYelling) {
    return 'Whoa, chill out!';
  } else if (isQuestion) {
    return 'Sure.';
  } else {
    return 'Whatever.';
  }
};
