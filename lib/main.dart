import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/bloc/blocku.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_application_1/setstate/setstate.dart';

final namaProvider = StateProvider<String>((ref) => "");
final emailProvider = StateProvider<String>((ref) => "");

void main() {
  runApp(
    BlocProvider(
      create: (context) => FormBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple)
      ),
      home: FormPage4()
    );
  }
}
