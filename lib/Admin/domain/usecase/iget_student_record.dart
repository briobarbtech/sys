import '../entities/student_record.dart';

abstract class IGetStudentRecord {
  Future<StudentRecord> getStudentRecord();
}
