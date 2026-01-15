// @ts-check

/**
 * Given a certain command, help the chatbot recognize whether the command is valid or not.
 *
 * @param {string} command
 * @returns {boolean} whether or not is the command valid
 */

export function isValidCommand(command) {
  let regex = new RegExp("^chatbot", 'gi');

  return regex.test(command);
}

/**
 * Given a certain message, help the chatbot get rid of all the emoji's encryption through the message.
 *
 * @param {string} message
 * @returns {string} The message without the emojis encryption
 */
export function removeEmoji(message) {
  let regex = new RegExp("emoji\\d{4}", "gi");

  return message.replace(regex, "");
}

/**
 * Given a certain phone number, help the chatbot recognize whether it is in the correct format.
 *
 * @param {string} number
 * @returns {string} the Chatbot response to the phone Validation
 */
export function checkPhoneNumber(number) {
  let regex = /^\(\+\d{2}\) \d{3}-\d{3}-\d{3}$/;
  
  if (regex.test(number)) {
    return "Thanks! You can now download me to your phone.";
  } else {
    return `Oops, it seems like I can't reach out to ${number}`;
  }
}

/**
 * Given a certain response from the user, help the chatbot get only the URL.
 *
 * @param {string} userInput
 * @returns {string[] | null} all the possible URL's that the user may have answered
 */
export function getURL(userInput) {
  // Regular expression to match URLs
  let urlRegex = /https?:\/\/[^\s]+|www\.[^\s]+|[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}/g;
  // Find all matches in the input text
  let matches = userInput.match(urlRegex);
  // Return the matches or an empty array if no matches are found
  return matches || [];
}


/**
 * Greet the user using the full name data from the profile.
 *
 * @param {string} fullName
 * @returns {string} Greeting from the chatbot
 */
export function niceToMeetYou(fullName) {
  let regex = /(\w+), (\w+)/;
  // Replace the matched pattern with "Nice to meet you, FirstName LastName"
  return fullName.replace(regex, 'Nice to meet you, $2 $1');
}
