import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/core/utils/helper.dart';

import '../../../../core/widgets/custom_error_widget.dart';
import '../manager/notification_cubit/notification_cubit.dart';
import 'EmptyNotificationWidget.dart';
import 'NotificationLoadingWidget.dart';
import 'NotificationViewBody.dart';

class NotificationViewBodyBlocBuilder extends StatelessWidget {
  const NotificationViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state is DeleteNotificationSuccess) {
          NotificationCubit.get(context).getNotification();
        } else if (state is DeleteNotificationFailure) {
          NotificationCubit.get(context).getNotification();
        }
        if (state is GetNotificationSuccess) {
          if (state.notificationModel.data!.isEmpty) {
            return const EmptyNotificationWidget();
          } else {
            return NotificationViewBody(
              notificationData: state.notificationModel.data!,
            );
          }
        } else if (state is GetNotificationFailure) {
          return CustomErrorWidget(
            errMessage: (context.textTrCheck(state.errMessage) != null
                ? context.textTr(state.errMessage)
                : state.errMessage),
            onPress: () {
              NotificationCubit.get(context).getNotification();
            },
          );
        } else {
          return const NotificationLoadingWidget();
        }
      },
    );
  }
}
