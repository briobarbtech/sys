import 'package:flutter/material.dart';
import 'package:studentrecord/Admin/domain/entities/student.dart';

class ProfileStudent extends StatelessWidget {
  final Student student;
  const ProfileStudent(this.student, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text(student.user.firstname),
            subtitle: Text(student.user.surname),
            leading: const Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }
}
