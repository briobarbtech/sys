import '../entities/student_record.dart';

abstract class IStudentRecordRepositoryPort {
  Future<StudentRecord> getStudentRecord();
}
