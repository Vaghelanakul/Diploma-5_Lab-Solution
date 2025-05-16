// W.A.P. to count number of even or odd number from an array of n numbers. (A)
import 'dart:io';

void main() {
  print("enter number:");
  int n = int.parse(stdin.readLineSync()!);
  if (n % 2 == 0)
    print("$n is even");
  else
    print("$n is odd");
}
