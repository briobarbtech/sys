import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studentrecord/Admin/application/pages/assignature_list.dart';
import 'package:studentrecord/Admin/application/pages/profile.dart';
//import 'package:studentrecord/Admin/application/pages/student_record_page_copy.dart';
import 'package:studentrecord/Admin/application/provider/provider.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getProductData);
    return Scaffold(
      appBar: AppBar(actions: const [BackButton()]),
      body: data.when(
          data: (data) => Center(
                  child: Column(children: [
                ProfileStudent(data.student),
                // TODO algo que me permita escoger entre los Student Record
                SubjectList(getProductData, data.student.user)
              ])),
          error: (e, s) => const Center(
                child: Text("Ups!"),
              ),
          loading: () => const CircularProgressIndicator()),
    );
  }
}
