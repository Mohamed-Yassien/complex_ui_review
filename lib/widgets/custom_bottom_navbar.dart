import 'package:complex_ui_review/layout/cubit/layout_cubit.dart';
import 'package:complex_ui_review/layout/cubit/layout_states.dart';
import 'package:complex_ui_review/widgets/app_colors.dart';
import 'package:complex_ui_review/widgets/custom_text.dart';
import 'package:complex_ui_review/widgets/svgicon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar(this.cubit, {super.key});

  final HomeLayoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit, HomeLayoutStates>(
      builder: (context, state) {
        return BottomAppBar(
          elevation: 0,
          shape: const CircularNotchedRectangle(),
          color: const Color(0xffFCFCFC),
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 2),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 18,
            ),
            width: double.infinity,
            child: Row(
              children: <Widget>[
                navBarItem(
                  icon: 'home',
                  title: 'Home',
                  hasText: cubit.tabController.index == 0,
                  onTap: () {
                    cubit.changeTab("orders");
                  },
                  iconColor: cubit.tabController.index == 0
                      ? AppColors.white
                      : AppColors.bottomBarUnSelected,
                  textColor: cubit.tabController.index == 0
                      ? AppColors.white
                      : AppColors.bottomBarUnSelected,
                  containerColor: cubit.tabController.index == 0
                      ? AppColors.primiry
                      : Colors.transparent,
                ),
                navBarItem(
                  icon: 'calendar',
                  title: 'Calendar',
                  hasText: cubit.tabController.index == 1,
                  onTap: () {
                    cubit.changeTab("home");
                  },
                  iconColor: cubit.tabController.index == 1
                      ? AppColors.white
                      : AppColors.bottomBarUnSelected,
                  textColor: cubit.tabController.index == 1
                      ? AppColors.white
                      : AppColors.bottomBarUnSelected,
                  containerColor: cubit.tabController.index == 1
                      ? AppColors.primiry
                      : Colors.transparent,
                ),
                navBarItem(
                  icon: 'notification',
                  title: 'Notification',
                  hasText: cubit.tabController.index == 2,
                  onTap: () {
                    cubit.changeTab("setting");
                  },
                  iconColor: cubit.tabController.index == 2
                      ? AppColors.white
                      : AppColors.bottomBarUnSelected,
                  textColor: cubit.tabController.index == 2
                      ? AppColors.white
                      : AppColors.bottomBarUnSelected,
                  containerColor: cubit.tabController.index == 2
                      ? AppColors.primiry
                      : Colors.transparent,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget navBarItem({
    required String icon,
    required Color iconColor,
    required Color textColor,
    required Color containerColor,
    required String title,
    required VoidCallback onTap,
    required hasText,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            alignment: Alignment.center,
            height: 44,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: hasText
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgIcon(
                        svg: icon,
                        size: 25,
                        color: iconColor,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: CustomText(
                            title,
                            textStyleEnum: TextStyleEnum.normal,
                            color: textColor,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  )
                : SvgIcon(
                    svg: icon,
                    size: 26,
                    color: iconColor,
                  ),
          ),
        ),
      ),
    );
  }
}
