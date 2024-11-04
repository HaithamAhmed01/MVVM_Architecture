import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/core/utils/helper.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_string.dart';
import '../manager/layout_cubit/cubit.dart';
import '../manager/layout_cubit/state.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        var bottomNavCurrentIndex = cubit.bottomNavCurrentIndex;
        return BottomNavigationBar(
          onTap: (index) {
            cubit.changeBottomNav(index);
          },
          currentIndex: bottomNavCurrentIndex,
          items: [
            BottomNavigationBarItem(
              icon: bottomNavCurrentIndex == 0
                  ? SvgPicture.asset(
                      Assets.iconsHomeAct,
                    )
                  : SvgPicture.asset(
                      Assets.iconsHome,
                    ),
              label: context.textTr(AppStrings.home),
            ),
            BottomNavigationBarItem(
              icon: bottomNavCurrentIndex == 1
                  ? SvgPicture.asset(
                      Assets.iconsBagAct,
                    )
                  : SvgPicture.asset(Assets.iconsBag),
              label: context.textTr(AppStrings.myOrders),
            ),
            BottomNavigationBarItem(
              icon: bottomNavCurrentIndex == 2
                  ? SvgPicture.asset(
                      Assets.iconsUserRoundedAct,
                    )
                  : SvgPicture.asset(
                      Assets.iconsUserRounded,
                    ),
              label: context.textTr(AppStrings.account),
            ),
          ],
        );
      },
    );
  }
}
