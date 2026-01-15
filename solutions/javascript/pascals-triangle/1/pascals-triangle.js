//
// This is only a SKELETON file for the 'Pascals Triangle' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const rows = (rows) => {
  let triangle = [];
  for (let i = 0; i < rows; i++) {
    triangle.push([]);
    for (let j = 0; j <= i; j++) {
      if (j === 0 || j === i) {
        triangle[i].push(1);
      } else {
        triangle[i].push(triangle[i - 1][j - 1] + triangle[i - 1][j]);
      }
    }
  }
  return triangle;
};
