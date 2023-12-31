import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_cubit/cubit/app_cubit_logics.dart';
import 'package:travel_app_cubit/services/data_services.dart';
import 'cubit/app_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubit>( // creat cubit & hold cubit
        create:(context) => AppCubit(
          data: DataServices(),
        ), // creat cubit
        child: AppCubitLogics(), // show logics
      ),
    );
  }
}
