import 'package:flutter/cupertino.dart';

class School {
  final String schoolName;
  final String address;

  School({required this.schoolName, required this.address});

  @override
  String toString() => 'School(schoolName: $schoolName, address: $address';
}

class ClassRoom {
  final String className;
  final String grade;
  final School school;
  ClassRoom(
      {required this.className, required this.grade, required this.school});
  @override
  String toString() =>
      'ClassRoom(className: $className, grade: $grade)\n${school.toString()}';
}

class Students {
  final String name;
  int age;
  final ClassRoom classRoom;
  Students({required this.name, required this.age, required this.classRoom});

  increaseAge() {
    age = age + 1;
    debugPrint(age.toString());
  }

  @override
  String toString() =>
      'Students(name: $name, age: $age)\n${classRoom.toString()}';
}
