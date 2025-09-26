import 'package:dart_basics_tarasiuk/models/university.dart';
import 'package:dart_basics_tarasiuk/models/student.dart';
import 'package:dart_basics_tarasiuk/models/professor.dart';
import 'package:dart_basics_tarasiuk/models/course.dart';

void main() {
  print('=== University Management System Demo ===');

  runUniversityDemo();
}

void runUniversityDemo() {
  print('=== runUniversityDemo method ===');
  //Створення університету
  University university = University(name: "Dart University");

  //Створення студентів
  Student anna = Student(
    id: "tar1", 
    firstName: "Anna", 
    lastName: "Tarasiuk", 
    birthDate: DateTime(2006, 9, 10),
  );

  Student danil = Student(
    id: "tar2", 
    firstName: "Danil", 
    lastName: "Tarasiuk", 
    birthDate: DateTime(2006, 10, 27),
  );

  //Додавання студентів
  university.addStudent(anna);
  university.addStudent(danil);

  //Створення професорів
  Professor professorDmitrii = Professor(
    id: "prof1", 
    firstName: "Dmitrii", 
    lastName: "Dowzenko", 
    birthDate: DateTime(1975, 3, 10), 
    department: "Computer Science", 
    salary: 75000,
  );

  Professor professorAnatolii = Professor(
    id: "prof2", 
    firstName: "Anatolii", 
    lastName: "Petrow", 
    birthDate: DateTime(1981, 5, 4), 
    department: "Mathematics", 
    salary: 73000,
  );

  //Додавання професорів
  university.addProfessor(professorDmitrii);
  university.addProfessor(professorAnatolii);

  //Створення курсів
  Course dartCourse = Course(
    id: "cour1", 
    name: "Dart Programming", 
    description: "Learn Dart language", 
    credits: 4, 
    instructor: professorDmitrii.fullName,
  );

  Course mathCourse = Course(
    id: "cour2", 
    name: "Math", 
    description: "Learn Math", 
    credits: 3, 
    instructor: professorAnatolii.fullName,
  );

  //Присвоєння курсів профессорам
  professorDmitrii.assignCourse("cour1");
  professorAnatolii.assignCourse("cour2");

  //Додавання курсів
  university.courses.addAll([dartCourse, mathCourse]);

  //Запис студентів на курси
  anna.enrollInCourse("cour1");
  anna.enrollInCourse("cour2");

  danil.enrollInCourse("cour1");
  danil.enrollInCourse("cour2");

  //Додавання оцінок
  anna.addGrade("cour1", 95);
  anna.addGrade("cour2", 90);

  danil.addGrade("cour1", 90);
  danil.addGrade("cour2", 85);

  //Відображення статистики університету
  print("\n=== University Statistics ===");
  print(university.generateStatistics());

  //Відображення статистики студентів
  print("\n=== Student ===");
  for (var student in university.students) {
    print(student);
    print("Enrolled courses: ${student.enrolledCourses}");
    print("Grades: ${student.grades}");
    print("Passed courses: ${student.getPassedCourses()}\n");
  }

  //Відображення статистики професорів
  print("=== Professors ===");
  for (var prof in university.professors) {
    print(prof);
    print("Taught courses: ${prof.taughtCourses.join(', ')}\n");
  }

  //Відображення статистики курсів
  print("=== Courses ===");
  for (var course in university.courses) {
    print(course);
    print("Has prerequisites: ${course.hasPrerequisites()}");
  }
}