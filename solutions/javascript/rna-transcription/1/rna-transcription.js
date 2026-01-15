//
// This is only a SKELETON file for the 'RNA Transcription' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const toRna = (sequence) => {
  let res = '';
  for(var i = 0; i < sequence.length; i++) {
    switch(sequence[i]) {
      case 'G':
        res+='C';
        break;
      case 'C':
        res+='G';
        break;
      case 'T':
        res+='A';
        break;
      case 'A':
        res+='U';
        break;
    }
  }
  return res;
};
