import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_cubit/cubit/app_cubit.dart';
import 'package:travel_app_cubit/cubit/app_state.dart';
import 'package:travel_app_cubit/misc/colors.dart';
import 'package:travel_app_cubit/widgets/app_buttons.dart';
import 'package:travel_app_cubit/widgets/app_large_text.dart';
import 'package:travel_app_cubit/widgets/app_text.dart';
import 'package:travel_app_cubit/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 3;
  int selectedIndex = -1; //default

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, CubitState>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("http://mark.bslmeiyu.com/uploads/" + detail.place.img),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubit>(context).goHome();
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 320,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 30,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: detail.place.name,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            AppLargeText(
                              text: "\$" + detail.place.price.toString(),
                              color: AppColors.mainColor,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            SizedBox(width: 10),
                            AppText(
                              text: detail.place.location,
                              color: AppColors.textColor1,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  color: detail.place.stars < index
                                      ? AppColors.textColor2
                                      : AppColors.starColor,
                                );
                              }),
                            ),
                            SizedBox(width: 10),
                            AppText(
                              text: "(5.0)",
                              color: AppColors.textColor2,
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        AppLargeText(
                          text: "People",
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                        SizedBox(height: 5),
                        AppText(
                          text: "Number of people in your group",
                          color: AppColors.mainTextColor,
                        ),
                        SizedBox(height: 10),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButton(
                                  backgorundColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  borderColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  size: 50,
                                  text: (index + 1).toString(),
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 20),
                        AppLargeText(
                          text: "Description",
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                        SizedBox(height: 10),
                        AppText(
                          text:
                              detail.place.description,
                          color: AppColors.mainTextColor,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButton(
                        backgorundColor: Colors.white,
                        color: AppColors.textColor1,
                        borderColor: AppColors.textColor2,
                        size: 60,
                        isIcon: true,
                        icon: Icons.favorite_border,
                      ),
                      SizedBox(width: 20),
                      ResponsiveButton(
                        isResponsive: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
