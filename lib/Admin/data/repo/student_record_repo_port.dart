import 'package:studentrecord/Admin/data/datasource/remote_datasource.dart';
import 'package:studentrecord/Admin/domain/entities/student_record.dart';
import 'package:studentrecord/Admin/domain/repo/istudent_record_repo_port.dart';

class StudentRecordRepositoryPort implements IStudentRecordRepositoryPort {
  RemoteDatasourceFake remoteDatasource;
  StudentRecordRepositoryPort(this.remoteDatasource);

  @override
  Future<StudentRecord> getStudentRecord() {
    return remoteDatasource.getStudentRecord();
  }
}
