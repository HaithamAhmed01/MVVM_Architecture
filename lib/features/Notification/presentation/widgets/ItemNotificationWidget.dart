import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test/core/utils/app_colors.dart';
import 'package:test/core/utils/helper.dart';
import 'package:test/features/Notification/presentation/manager/notification_cubit/notification_cubit.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/widgets/buildBoxDecoration.dart';
import '../../data/models/notification_model/notification_data.dart';

class ItemNotificationWidget extends StatelessWidget {
  const ItemNotificationWidget({
    super.key,
    required this.notificationData,
  });

  final NotificationData notificationData;

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationCubit, NotificationState>(
      listener: (context, state) {
        // if (state is DeleteNotificationSuccess) {
        //   NotificationCubit.get(context).getNotification();
        // } else if (state is DeleteNotificationFailure) {
        //   NotificationCubit.get(context).getNotification();
        // }
      },
      child: Dismissible(
        key: Key(notificationData.id!),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {
          NotificationCubit.get(context)
              .deleteNotification(notificationId: notificationData.id!);
        },
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppPadding.p32,
            left: AppPadding.p16,
            right: AppPadding.p16,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
            decoration: buildLightShapeDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        notificationData.title ?? "",
                        style: context.titleMedium(),
                      ),
                      GestureDetector(
                        onTap: () {
                          NotificationCubit.get(context).deleteNotification(
                              notificationId: notificationData.id!);
                        },
                        child: SvgPicture.asset(
                          Assets.iconsCloseCircle,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  AppSize.s8.height,
                  Text(
                    notificationData.message ?? "",
                    style: context.bodyLarge(),
                  ),
                  AppSize.s8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        notificationData.date ?? "",
                        style: context.bodyMedium().copyWith(
                              color: const Color(0xFF96969B),
                            ),
                      ),
                      AppSize.s8.width,
                      Text(
                        notificationData.time ?? "",
                        style: context.bodyMedium().copyWith(
                              color: const Color(0xFF96969B),
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
