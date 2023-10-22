import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_cubit/cubit/app_cubit.dart';
import 'package:travel_app_cubit/widgets/app_large_text.dart';
import 'package:travel_app_cubit/widgets/app_text.dart';
import 'package:travel_app_cubit/widgets/responsive_button.dart';

import '../misc/colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/" + images[index]),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Trips"),

                      // appLargeText(
                      // text: "Discover",
                      // color: Colors.red,
                      // ),
                      AppText(
                        text: 'Mountain',
                        size: 30,
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 250,
                        child: AppText(
                          text:
                              "Mountain hikes give you an incredible sense of freedom along with endurance test",
                          color: AppColors.textColor2,
                          size: 14,
                        ),
                      ),
                      SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubit>(context).getData();  //BlocProvider bu cubit'i tutuyor(holds)
                        },
                        child: Container(
                          width: 200,
                          child: Row(
                            children: [
                              ResponsiveButton(
                                width: 120,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                      children: List.generate(3, (indexDots) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      width: 8,
                      height: index==indexDots?25:8, // eğer o sayfadaysak dots height 28 olacak değilsek 25
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index==indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.3),
                      ),
                    );
                  })),
                ]),
              ),
            );
          }),
    );
  }
}
