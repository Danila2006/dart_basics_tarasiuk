import 'package:dart_basics_tarasiuk/models/course.dart';
import 'package:dart_basics_tarasiuk/models/professor.dart';
import 'package:dart_basics_tarasiuk/models/student.dart';
import 'package:dart_basics_tarasiuk/models/university.dart';
import 'package:dart_basics_tarasiuk/utils/calculator.dart';
import 'package:dart_basics_tarasiuk/utils/data_processor.dart';
import 'package:dart_basics_tarasiuk/utils/text_analyzer.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Calculator tests', () {
    test('Addition', () {
      expect(calculate(2, 3, '+'), 5);
    });

    test('Subtraction', () {
      expect(calculate(5, 3, '-'), 2);
    });

    test('Multiplication', () {
      expect(calculate(4, 3, '*'), 12);
    });

    test('Division', () {
      expect(calculate(10, 2, '/'), 5);
    });

    test('Division by zero', () {
      expect(() => calculate(10, 0, '/'), throwsException);
    });

    test('Unknown operation', () {
      expect(() => calculate(1, 1, '^'), throwsException);
    });
  });

  group('TextAnalyzer tests', () {
    test('Simple text', () {
      final text = 'Dart is fun';
      final result = analyzeText(text);
      expect(result['charCount'], 9);
      expect(result['wordCount'], 3);
    });

    test('Text with multiple spaces', () {
      final text = '  Dart   is   cool  ';
      final result = analyzeText(text);
      expect(result['charCount'], 10);
      expect(result['wordCount'], 3);
    });

    test('Empty text', () {
      final text = '';
      final result = analyzeText(text);
      expect(result['charCount'], 0);
      expect(result['wordCount'], 0);
    });
  });

  group('DataProcessor tests', () {

    test('filterEvenNumbers', () {
      final numbers = [1, 2, 3, 4, 5, 6];
      final result = DataProcessor.filterEvenNumbers(numbers);
      expect(result, [2, 4, 6]);
    });

    test('countWords', () {
      final text = 'Dart is a programming language Dart';
      final result = DataProcessor.countWords(text);
      expect(result['dart'], 2);
      expect(result['programming'], 1);
    });

    test('sortStudentByGpa', () {
      final students = [
        Student(id: 's1', firstName: 'A', lastName: 'B', birthDate: DateTime(2000,1,1), grades: {'math': 80}),
        Student(id: 's2', firstName: 'C', lastName: 'D', birthDate: DateTime(2000,1,1), grades: {'math': 90}),
      ];
      final sorted = DataProcessor.sortStudentByGpa(students);
      expect(sorted[0]['id'], 's2'); // студент с большей GPA первым
    });

    test('findCommonCourses', () {
      final students = [
        Student(id: 's1', firstName: 'A', lastName: 'B', birthDate: DateTime(2000,1,1), enrolledCourses: ['c1', 'c2']),
        Student(id: 's2', firstName: 'C', lastName: 'D', birthDate: DateTime(2000,1,1), enrolledCourses: ['c2', 'c3']),
      ];
      final common = DataProcessor.findCommonCourses(students);
      expect(common, {'c2'});
    });

    test('calculateAverageGradesByCourse', () {
      final students = [
        Student(id: 's1', firstName: 'A', lastName: 'B', birthDate: DateTime(2000,1,1), grades: {'math': 80}),
        Student(id: 's2', firstName: 'C', lastName: 'D', birthDate: DateTime(2000,1,1), grades: {'math': 90}),
      ];
      final avg = DataProcessor.calculateAverageGradesByCourse(students);
      expect(avg['math'], 85.0);
    });

    test('generateReport', () {
      final student = Student(id: 's1', firstName: 'Anna', lastName: 'B', birthDate: DateTime(2000,1,1), enrolledCourses: ['c1'], grades: {'c1': 80});
      final professor = Professor(id: 'p1', firstName: 'Prof', lastName: 'X', birthDate: DateTime(1970,1,1), department: 'CS', salary: 50000);
      final course = Course(id: 'c1', name: 'Math', description: 'Math course', credits: 3, instructor: 'Prof X');

      final uni = University(name: 'Uni', students: [student], professors: [professor], courses: [course]);

      final report = DataProcessor.generateReport(uni);

      expect(report.any((e) => e['type'] == 'student'), true);
      expect(report.any((e) => e['type'] == 'professor'), true);
      expect(report.any((e) => e['type'] == 'course'), true);
    });
  });
}