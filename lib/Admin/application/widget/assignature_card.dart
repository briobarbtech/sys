import 'package:flutter/material.dart';

class AssignatureCard extends StatelessWidget {
  const AssignatureCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: const [Text("Titulo"), Text("Subtitulo"), Text("Nota")],
      ),
    );
  }
}
