// Задание 2 - Объект из реальной жизни.

void main() {
 var lili = LanguageCourse("Lili", 2005, "English", 6, 1, "Alex", "New York");
  print(lili.toString());
    
  // использование методов
  lili.visit();
  lili.languageLevel();
  print(lili.leftToStudy());
}

class LanguageCourse {
  final String studentName;
  int year;
  final String title;  // название курса
  int duration;  // длительность курса в месяцах
  int level;  // текущий уровень  
  String teacherName; // имя учителя
  String place;  // место-город
  
  LanguageCourse(this.studentName, this.year, this.title, this.duration, this.level, this.teacherName, this.place);
  
  
  void visit(){
    print("I go to $title courses in $place, my teacher: $teacherName"); // ходит на курсы
  }
  
  void languageLevel(){
    print("Language level: $level");
  }
  
  leftToStudy(){
    int result = duration - level;
    return "$result months left to study";
  }
  
  @override
  toString(){
    return 'Name: $studentName, Age: ${DateTime.now().year-year}';
  }
}
