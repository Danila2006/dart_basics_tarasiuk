import 'student.dart';
import 'professor.dart';
import 'course.dart';

class University {
  final String name;
  final List<Student> students;
  final List<Professor> professors;
  final List<Course> courses;

  University({
    required this.name,
    List<Student>? students,
    List<Professor>? professors,
    List<Course>? courses,
  }) : students = students ?? [],
       professors = professors ?? [],
       courses = courses ?? [];
  
  void addStudent(Student student) {
    if (!students.any((s) => s.id == student.id)) {
      students.add(student);
    }
  }

  void removeStudent(String studentId) {
    students.removeWhere((s) => s.id == studentId);
  }

  Student? findStudentById(String id) {
    try {
      return students.firstWhere((s) => s.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Student> getStudentByCourse(String courseId) {
    return students.where((s) => s.enrolledCourses.contains(courseId)).toList();
  }

  List<Course> getAvailableCoursesForStudent(String studentId) {
    final student = findStudentById(studentId);
    if (student == null) {
      return [];
    }

    return courses.where((course) {
      return course.canStudentEnroll(student) 
        && !student.enrolledCourses.contains(course.id);
    }).toList();
  }

  Map<String, dynamic> generateStatistics() {
    final totalStudents = students.length;
    final averageGpa = students.isEmpty ? 0.0 
        : students.map((s) => s.gpa).reduce((a, b) => a + b) / totalStudents;

    return {
      'totalStudents': totalStudents,
      'averageGPA': averageGpa,
      'totalProfessors': professors.length,
      'totalCourses': courses.length,
    };
  }
}