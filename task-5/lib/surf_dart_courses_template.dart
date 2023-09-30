// Спорт это классно!
class Person{
  final String name;
  
  Person(this.name);
  
   void displayInfo() {
    print('Name: $name');
  }
}

class Dancer extends Person{
  String style;
  
  Dancer(String name, this.style) : super (name);
  
  @override
  void displayInfo(){
    super.displayInfo();
    print('Style: $style');
  }
}

class Choreographer extends Person{
  int trophiesWon;
  
  Choreographer(String name, this.trophiesWon) : super(name);
  
  @override
  void displayInfo(){
    super.displayInfo();
    print('Trophies Won: $trophiesWon');
  }
}

class DancerRole{
  String name;
  String description;

  DancerRole(this.name, this.description);
}

void main(){
  var dancer = Dancer("Liza", "hip-hop");
  var choreographer = Choreographer("Max", 13);
  var role = DancerRole("dancer", "loves different styles of dance, mainly modern and hip-hop");
  
  print('Dancer Info:');
  dancer.displayInfo();

  print('\nChoreographer Info:');
  choreographer.displayInfo();

  print('\nDancer Info:');
  print('Name: ${role.name}');
  print('Description: ${role.description}');

}