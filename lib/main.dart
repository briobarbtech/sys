import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studentrecord/Admin/application/pages/assignature_list.dart';
import 'package:studentrecord/Admin/application/pages/home.dart';
//import 'package:studentrecord/Admin/application/pages/student_record_page_copy.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'GoRouter Example',
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return Home();
        },
      ),
      GoRoute(
          path: '/subject_list',
          builder: (BuildContext context, GoRouterState state) {
            return SubjectList();
          }),
    ],
  );
}
