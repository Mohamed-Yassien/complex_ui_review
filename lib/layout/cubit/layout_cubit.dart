import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout_states.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);
  late TabController tabController;

  void changeTab(String tab) {
    switch (tab) {
      case "orders":
        tabController.animateTo(0);
        break;
      case "home":
        tabController.animateTo(1);
        break;
      case "setting":
        tabController.animateTo(2);
        break;
      default:
        tabController.animateTo(0);
    }
    emit(HomeLayoutChangeScreenState());
  }
}
