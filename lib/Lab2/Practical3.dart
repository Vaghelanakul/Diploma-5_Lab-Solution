// 3. W.A.P. to insert Strings into List and display in terminal. (A)

import "dart:io";

void main() {
  print("enter the number of Strings you want to enter in list");
  int n = int.parse(stdin.readLineSync()!);
  List<String> lst = [];
  for (int i = 0; i < n; i++) {
    print("enter String ${i + 1}");
    String str = stdin.readLineSync()!;
    lst.add(str);
  }
  print("list of string is:$lst");
}
