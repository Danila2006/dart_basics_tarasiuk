import 'package:dart_basics_tarasiuk/models/course.dart';
import 'package:dart_basics_tarasiuk/models/professor.dart';
import 'package:dart_basics_tarasiuk/models/student.dart';
import 'package:dart_basics_tarasiuk/models/university.dart';
import 'package:dart_basics_tarasiuk/utils/data_processor.dart';

void main() {
  print('=== Dart Collections & Data Processing Demo ===');

  //Тестові дані
  //Професори
  final professors = [
    Professor(
      id: 'prof1', 
      firstName: 'Dmitrii', 
      lastName: 'Dowzenko', 
      birthDate: DateTime(1975, 3, 10), 
      department: 'Computer Science', 
      salary: 75000
    ),

    Professor(
      id: 'prof2', 
      firstName: 'Anatolii', 
      lastName: 'Petrow', 
      birthDate: DateTime(1981, 5, 4), 
      department: 'Mathematics and Physics', 
      salary: 73000
    )
  ];

  //Курси
  final courses = [
    Course(
      id: 'cour1', 
      name: 'Mathematics', 
      description: 'Learn Mathematics',
      credits: 3,
      instructor: 'Anatolii Petrow'
    ),
    Course(
      id: 'cour2', 
      name: 'Physics',
      description: 'Learn Physics', 
      credits: 4,
      instructor: 'Anatolii Petrow'
    ),
    Course(
      id: 'cour3', 
      name: 'Dart Programming',
      description: 'Lern Dart language',
      credits: 3, 
      instructor: 'Dmitrii Dowzenko'
    ),
      
  ];

  //Студенти
  final students = [
    Student(
      id: 'tar1',
      firstName: 'Anna',
      lastName: 'Tarasiuk',
      birthDate: DateTime(2005, 5, 20),
      enrolledCourses: ['cour1', 'cour3'],
      grades: {'cour1': 90, 'cour3': 80}
    ),
    Student(
      id: 'tar2',
      firstName: 'Danil',
      lastName: 'Tarasiuk',
      birthDate: DateTime(2006, 8, 12),
      enrolledCourses: ['cour1', 'cour3'],
      grades: {'cour1': 75, 'cour2': 85}
    ),
    Student(
      id: 'tar3',
      firstName: 'Yurii',
      lastName: 'Tarasiuk',
      birthDate: DateTime(2004, 5, 20),
      enrolledCourses: ['cour2', 'cour3'],
      grades: {'cour2': 95, 'cour3': 88}
    )
  ];

  //Університет
  final university = University(name: 'Dart University', students: students, professors: professors, courses:  courses);

  demonstrateLists(students);
  demonstrateSets(students);
  demonstrateMaps(students);
  demonstrateAdvancedOperations(university);
}

void demonstrateLists(List<Student> students) {
  print('\n=== demonstrateLists method ===');

  final numbers = [1, 2, 3, 4, 5, 6, 7];
  print('Original numbers: $numbers');
  print('Even numbers: ${DataProcessor.filterEvenNumbers(numbers)}');

  final sortedStudents = DataProcessor.sortStudentByGpa(students);
  print('Students sorted by GPA: $sortedStudents');
}

void demonstrateSets(List<Student> students) {
  print('\n=== demonstrateSets method ===');

  final commonCourses = DataProcessor.findCommonCourses(students);
  print('Common courses among all students: $commonCourses');
}

void demonstrateMaps(List<Student> students) {
  print('\n=== demonstrateMaps method ===');

  String text = 'Dart is a programmin language';
  print('Word count: ${DataProcessor.countWords(text)}');

  final groupedStudentsByYear = DataProcessor.groupStudentsByYear(students);
  print('Grouped students by birth year:');
  groupedStudentsByYear.forEach((year, group) {
    print('  $year -> ${group.map((student) => student.fullName).toList()}');
  });

  final averageGrades = DataProcessor.calculateAverageGradesByCourse(students);
  print('Average grades by course: $averageGrades');
}

void demonstrateAdvancedOperations(University university) {
  print('\n=== demonstrateAdvancedOperations method ===');

  final report = DataProcessor.generateReport(university);
  print('Generated University Report:');
  for (var entry in report) {
    print('$entry\n');
  }
}