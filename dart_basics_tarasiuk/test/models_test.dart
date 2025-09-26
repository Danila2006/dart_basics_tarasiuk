import 'package:dart_basics_tarasiuk/models/course.dart';
import 'package:dart_basics_tarasiuk/models/professor.dart';
import 'package:dart_basics_tarasiuk/models/student.dart';
import 'package:dart_basics_tarasiuk/models/university.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Student class tests', () {
    test('GPA calculation', () {
      final student = Student(
        id: 'tar1',
        firstName: 'Anna',
        lastName: 'Tarasiuk',
        birthDate: DateTime(2005, 5, 20),
        grades: {'math': 90, 'physics': 80}
      );

      expect(student.gpa, closeTo(85.0, 0.01));
    });

    test('Enroll in course', () {
      final student = Student(
        id: 'tar1',
        firstName: 'Anna',
        lastName: 'Tarasiuk',
        birthDate: DateTime(2005, 5, 20),
      );

      student.enrollInCourse('math');
      expect(student.enrolledCourses.contains('math'), isTrue);
    });
  });

  group('Professor class tests', () {
    test('Assign and remove course', () {
      final professor = Professor(
        id: 'prof1',
        firstName: 'Dmitrii',
        lastName: 'Dowzenko',
        birthDate: DateTime(1975, 3, 10),
        department: 'Mathematics',
        salary: 75000,
      );

      professor.assignCourse('cour1');
      expect(professor.taughtCourses.contains('cour1'), isTrue);

      professor.removeCourse('cour1');
      expect(professor.taughtCourses.contains('cour1'), isFalse);
    });
  });

  group('Course class tests', () {
    test('Prerequisites check', () {
      final student = Student(
        id: 'tar1',
        firstName: 'Anna',
        lastName: 'Tarasiuk',
        birthDate: DateTime(2005, 5, 20),
        grades: {'math': 70},
      );

      final course = Course(
        id: 'cour1',
        name: 'Physics',
        description: 'Learn Physics',
        credits: 4,
        instructor: 'Anatolii',
        prerequisites: ['math'],
      );

      expect(course.canStudentEnroll(student), isTrue);
    });
  });

  group('University class tests', () {
    test('Add student', () {
      final university = University(name: 'Dart University');
      final student = Student(
        id: 'tar1',
        firstName: 'Anna',
        lastName: 'Tarasiuk',
        birthDate: DateTime(2005, 5, 20),
      );

      university.addStudent(student);
      expect(university.students.length, 1);
      expect(university.students.first.fullName, 'Anna Tarasiuk');
    });
  });
}