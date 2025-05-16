// 2. W.A.P. to create class Animal that has a method called animalSound()
// Subclass of

class Animal {
  void animalSound() {
    print("animal sound");
  }
}

class Cat extends Animal {
  @override
  void animalSound() {
    print("meow");
  }
}

void main() {
  Animal a = new Animal();
  a.animalSound();

  Cat c = new Cat();
  c.animalSound();
}
