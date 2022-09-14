import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studentrecord/Admin/application/pages/student_record_page.dart';
import 'package:studentrecord/Admin/domain/entities/student_record.dart';
import 'package:studentrecord/Admin/domain/entities/user.dart';

class SubjectList extends ConsumerWidget {
  final FutureProvider<StudentRecord> studentRecord;
  final IESUser user;
  const SubjectList(this.studentRecord, this.user, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(studentRecord);
    return data.when(
        data: (data) {
          return Center(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: data.materias.length,
                itemBuilder: (context, index) => ListTile(
                    title: Text(data.materias[index].subjectName),
                    onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StudentRecordPage(
                                      data.materias[index], user)))
                        })),
          );
        },
        error: (e, s) => const Center(
              child: Text("Ups! error!"),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
