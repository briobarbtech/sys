import 'package:flutter/material.dart';

Widget studentProfile() {
  return Card(
    child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: CircleAvatar(
            child: Icon(Icons.account_circle_rounded),
          ),
        ),
        Column(
          children: const [
            Text("Nombre y Apellido: "),
            Text("DNI: "),
            Text("Fecha de nacimiento: "),
            Text("Email: ")
          ],
        )
      ],
    ),
  );
}
