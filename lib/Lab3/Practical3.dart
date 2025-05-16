// 3. W.A.P. to ƒind friends detail by their name using dictionary. (Create local
// dictionary and search from it using Map & Model Class) (C)

import "dart:io";

class Friend {
  String name;
  int age;

  Friend(this.name, this.age);

  void display() {
    print("Name:$name");
    print("age:$age");
  }
}

void main() {
  Map<String, Friend> friends = {
    "abc": Friend("abc", 22),
    "xyz": Friend("xyz", 20),
    "asd": Friend("asd", 18)
  };
  print("enter search name:");
  String searchName = stdin.readLineSync()!;
  if (friends.containsKey(searchName)) {
    print("friend found");
    Friend friend = friends[searchName]!;
    friend.display();
  }
}
