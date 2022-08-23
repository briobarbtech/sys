import 'package:studentrecord/Admin/domain/entities/course.dart';
import 'package:studentrecord/Admin/domain/entities/syllabus.dart';
import 'package:studentrecord/Admin/domain/entities/user.dart';

class Student extends UserRole {
  late List<Syllabus> syllabuses;
  List<Course> courses = [];

  Student({required user}) : super(user: user);

  @override
  Enum userRoleName() {
    return UserRoleNames.student;
  }
}
