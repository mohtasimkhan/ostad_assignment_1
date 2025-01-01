abstract class Role {
  void displayRole();
}

class Person implements Role {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  @override
  void displayRole() {}
}

class Student extends Person {
  String studentID;
  String grade;
  List<double> courseScores;

  Student(
      String name, int age, String address, this.studentID, this.grade, this.courseScores)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) return 0.0;
    return courseScores.reduce((a, b) => a + b) / courseScores.length;
  }
}

class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher(String name, int age, String address, this.teacherID, this.coursesTaught)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayCourses() {
    for (var course in coursesTaught) {
      print("- $course");
    }
  }
}

class StudentManagementSystem {
  void manageSystem() {
    Student student = Student(
      "John Doe",
      20,
      "123 Main St",
      "S12345",
      "A",
      [90, 85, 82],
    );

    Teacher teacher = Teacher(
      "Mrs. Smith",
      35,
      "456 Oak St",
      "T98765",
      ["Math", "English", "Bangla"],
    );

    print("Student Information:");
    student.displayRole();
    print("Name: ${student.name}");
    print("Age: ${student.age}");
    print("Address: ${student.address}");
    print("Average Score: ${student.calculateAverageScore()}");

    print("\n");

    print("Teacher Information:");
    teacher.displayRole();
    print("Name: ${teacher.name}");
    print("Age: ${teacher.age}");
    print("Address: ${teacher.address}");
    teacher.displayCourses();
  }
}

void main() {
  StudentManagementSystem sms = StudentManagementSystem();
  sms.manageSystem();
}

