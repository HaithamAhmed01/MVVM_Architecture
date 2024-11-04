import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Home/presentation/view/HomeView.dart';
import '../../../Layout/manager/layout_cubit/state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of<LayoutCubit>(context);

  // CurrentBottomNavIndex
  int bottomNavCurrentIndex = 0;

  List<Widget> bottomScreens = [
    const HomeView(),
  ];

  // BottomNav
  void changeBottomNav(int index) {
    bottomNavCurrentIndex = index;
    emit(ChangeBottomNavBarState());
  }
}
