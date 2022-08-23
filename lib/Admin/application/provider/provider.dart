import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studentrecord/Admin/data/datasource/remote_datasource.dart';
import 'package:studentrecord/Admin/data/repo/student_record_repo_port.dart';
import 'package:studentrecord/Admin/domain/entities/student_record.dart';
import 'package:studentrecord/Admin/domain/usecase/get_student_record.dart';
import 'package:studentrecord/Admin/domain/usecase/iget_student_record.dart';

//Data
/* final studentRecordDatasource = Provider<IRemoteDatasource>(
  (ref) => StudentRecordRemote(),
); */
//Repository
final studentRepositoryProvider =
    StateProvider((ref) => StudentRecordRepositoryPort(RemoteDatasourceFake()));
//Presentation

final getStudentRecord = StateProvider<IGetStudentRecord>(
    (ref) => GetStudentRecord(ref.watch(studentRepositoryProvider)));

final getProductData = FutureProvider<StudentRecord>((ref) async {
  return ref.read(getStudentRecord).getStudentRecord();
});
