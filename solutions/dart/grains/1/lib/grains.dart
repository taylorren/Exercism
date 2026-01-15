BigInt square(final int n) {
  // Replace the throw call and put your code here
  return BigInt.two.pow(n - 1);
}

BigInt total() {
  BigInt sum = BigInt.zero;
  for(int i = 1; i <= 64; i++){
    sum += square(i);
  }
  return sum;
  //throw UnimplementedError();
}
