import 'package:studentrecord/Admin/domain/entities/student_record.dart';
import 'package:studentrecord/Admin/domain/repo/istudent_record_repo_port.dart';

class GetStudent {
  final IStudentRecordRepositoryPort studentRepositoryPort;
  GetStudent(this.studentRepositoryPort);

  Future<StudentRecord> getProducts() {
    final student = studentRepositoryPort.getStudentRecord();
    return student;
  }
}
