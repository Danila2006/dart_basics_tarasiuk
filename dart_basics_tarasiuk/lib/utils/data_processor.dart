import 'package:dart_basics_tarasiuk/models/student.dart';
import 'package:dart_basics_tarasiuk/models/university.dart';

class DataProcessor {
  static List<int> filterEvenNumbers(List<int> numbers) {
    return numbers.where((num) => num.isEven).toList(); 
  }

  static Map<String, int> countWords(String text) {
    final words = text.split(RegExp(r'\s+'));
    final Map<String, int> counts = {};
    for (var word in words) {
      final w = word.toLowerCase();
      counts[w] = (counts[w] ?? 0) + 1;
    }
    return counts;
  }

  static List<Map<String, dynamic>> sortStudentByGpa(List<Student> students) {
    final sorted = List<Student>.from(students)
      ..sort((a, b) => b.gpa.compareTo(a.gpa));
    return sorted
        .map((student) => {'id': student.id, 'fullName': student.fullName, 'GPA': student.gpa})
        .toList();
  }

  /*static Set<String> getUniqueSkills(List<Student> students) {
    В мене немає поля skills у Student
  }*/

  static Set<String> findCommonCourses(List<Student> students) {
    return students
        .map((student) => student.enrolledCourses.toSet())
        .reduce((a, b) => a.intersection(b));
  }

  static Map<String, List<Student>> groupStudentsByYear(List<Student> students) {
    final Map<String, List<Student>> groups = {};
    for (var student in students) {
      final year = student.birthDate.year.toString();
      groups.putIfAbsent(year, () => []).add(student);
    }
    return groups;
  }

  static Map<String, double> calculateAverageGradesByCourse(List<Student> students) {
    final Map<String, List<double>> courseGrades = {};
    for (var student in students) {
      student.grades.forEach((courseId, grade) {
        courseGrades.putIfAbsent(courseId, () => []).add(grade);
      });
    }

    final Map<String, double> averageGrades = {};
    courseGrades.forEach((courseId, grades) {
      averageGrades[courseId] = grades.reduce((a, b) => a + b) / grades.length;
    }); 

    return averageGrades;
  }

  static List<Map<String, dynamic>> generateReport(University university) {
    final studentReport = university.students.map((student) {
      final coursesInfo = student.enrolledCourses.map((coursesId) {
        final course = university.courses.firstWhere((c) => c.id == coursesId);
        final grade = student.grades[coursesId];
        return {
          'courseId': course.id,
          'courseName': course.name,
          'instructor': course.instructor,
          'grade': grade,
        };
      }).toList();

      return {
        'type': 'student',
        'id': student.id,
        'fullName': student.fullName,
        'age': student.age,
        'GPA': student.gpa,
        'enrolledCourses': coursesInfo,
        'passedCourses': student.getPassedCourses(),
      };
    }).toList();

    final professorsReport = university.professors.map((professor) {
      return {
        'type': 'professor',
        'id': professor.id,
        'fullName': professor.fullName,
        'department': professor.department,
        'salary': professor.salary,
        'taughtCourses': professor.taughtCourses,
      };
    }).toList();

    final coursesReport = university.courses.map((course) {
      final enrolledStudents = university.getStudentByCourse(course.id);
      final averageGrade = enrolledStudents.isEmpty 
          ? 0.0 
          : enrolledStudents
              .where((student) => student.grades.containsKey(course.id))
              .map((student) => student.grades[course.id]!)
              .fold(0.0, (a, b) => a + b) / (enrolledStudents.where((s) => s.grades.containsKey(course.id)).length);

      return {
        'type': 'course',
        'id': course.id,
        'name': course.name,
        'instructor': course.instructor,
        'credits': course.credits,
        'enrolledStudents': enrolledStudents.map((s) => s.fullName).toList(),
        'averageGrade': averageGrade,
        'hasPrerequisites': course.hasPrerequisites(),
      };
    }).toList();

    return [...studentReport, ...professorsReport, ...coursesReport];
  }
}