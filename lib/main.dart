import 'package:candidate_app/core/observers/bloc_observer.dart';
import 'package:candidate_app/injection.dart';
import 'package:candidate_app/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  configureDependencies();
  setupBlocObserver();
  runApp(const MyApp());
}

void setupBlocObserver() {
  Bloc.observer = SimpleBlocObserver();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
