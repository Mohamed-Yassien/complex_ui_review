import 'package:complex_ui_review/screens/layout/cubit/layout_cubit.dart';
import 'package:complex_ui_review/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    final cubit = HomeLayoutCubit.get(context);
    cubit.tabController =
        TabController(length: 3, vsync: this, initialIndex: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = HomeLayoutCubit.get(context);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: TabBarView(
            controller: cubit.tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              Scaffold(),
              Scaffold(),
              Scaffold(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        cubit,
      ),
    );
  }
}
