import 'dart:io';

void main() {
  stdout.write("Enter the number of elements: ");
  int n = int.parse(stdin.readLineSync()!);

  List<int> numbers = [];

  for (int i = 0; i < n; i++) {
    stdout.write("Enter number ${i + 1}: ");
    int num = int.parse(stdin.readLineSync()!);
    numbers.add(num);
  }

  int evenCount = 0;
  int oddCount = 0;

  for (int i in numbers) {
    if (i % 2 == 0) {
      evenCount++;
    } else {
      oddCount++;
    }
  }

  print("Number of even numbers: $evenCount");
  print("Number of odd numbers: $oddCount");
}
