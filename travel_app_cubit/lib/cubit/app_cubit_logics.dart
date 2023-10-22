import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_cubit/cubit/app_cubit.dart';
import 'package:travel_app_cubit/cubit/app_state.dart';
import 'package:travel_app_cubit/pages/detail_page.dart';
import 'package:travel_app_cubit/pages/home_page.dart';
import 'package:travel_app_cubit/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AppCubit, CubitState>(//BlocBuilder
          listener: (context, state) {
        if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
          // final snackBar = SnackBar(
          // content: Text("Bir hata oluştu!"),
          // );

          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
          //check states. BlockBuilder ile state'leri check ediyoruz.
          builder: (context, state) {
        //takes a function
        if (state is WelcomeState) {
          return const WelcomePage();
        }
        if (state is DetailState) {
          return const DetailPage();
        }
        if (state is LoadedState) {
          return HomePage();
        }
        if (state is LoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
