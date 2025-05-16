// 2. W.A.P. to insert int numbers into List and display in terminal. (A)

import "dart:io";

void main() {
  List<int> lst = [];
  print("enter the number you want to add in list:");
  int n = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < n; i++) {
    print("enter ${i + 1} number:");
    int num = int.parse(stdin.readLineSync()!);
    lst.add(num);
  }
  print("list of number is:$lst");
}
