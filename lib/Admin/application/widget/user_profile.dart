import 'package:flutter/material.dart';
import 'package:studentrecord/Admin/domain/entities/user.dart';

Widget userProfile(IESUser user) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      const CircleAvatar(),
      Column(
        children: [
          Text("${user.firstname} ${user.surname}"),
          Text(user.dni.toString())
        ],
      )
    ]),
  );
}
