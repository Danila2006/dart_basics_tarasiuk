import 'person.dart';

class Professor extends Person {
  final String department;
  final List<String> taughtCourses;
  final double salary;

  Professor({
    required String id,
    required String firstName,
    required String lastName,
    required DateTime birthDate,
    required this.department,
    required this.salary,
    List<String>? taughtCourses,
  }) : taughtCourses = taughtCourses ?? [],
        super(
          id: id, 
          firstName: firstName, 
          lastName: lastName, 
          birthDate: birthDate
        );

  @override
  String get role => 'Professor';

  void assignCourse(String courseId) {
    if (!taughtCourses.contains(courseId)) {
      taughtCourses.add(courseId);
    }
  }

  void removeCourse(String courseId) {
    if (taughtCourses.contains(courseId)) {
      taughtCourses.remove(courseId);
    }
  }

  @override
  String toString() {
    return 'Professor(name: $fullName, department: $department, salary: $salary, courses: ${taughtCourses.join(', ')})';
  }
}