import '../../domain/entities/student_record.dart';

abstract class IRemoteDatasource {
  Future<StudentRecord> getStudentRecord();
}
