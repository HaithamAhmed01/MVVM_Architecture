import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/layout_cubit/cubit.dart';
import '../manager/layout_cubit/state.dart';
import '../widgets/BottomNavBarWidget.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        var bottomNavCurrentIndex = cubit.bottomNavCurrentIndex;
        return Scaffold(
          bottomNavigationBar: const BottomNavBarWidget(),
          body: IndexedStack(
            index: bottomNavCurrentIndex,
            children: cubit.bottomScreens,
          ),
        );
      },
    );
  }
}
