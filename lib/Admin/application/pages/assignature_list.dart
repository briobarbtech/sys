import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studentrecord/Admin/application/pages/student_record_page_copy.dart';
import 'package:studentrecord/Admin/domain/entities/student_record.dart';

class AssignatureList extends ConsumerWidget {
  final FutureProvider<StudentRecord> studentRecord;
  const AssignatureList(this.studentRecord, {Key? key}) : super(key: key);

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
                    title: Text(data.materias[index].nombre),
                    onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      StudentRecordPage(index, studentRecord)))
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
