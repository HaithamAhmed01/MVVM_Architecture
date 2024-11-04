import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../data/models/notification_model/notification_data.dart';
import 'ItemNotificationWidget.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key, required this.notificationData});

  final List<NotificationData> notificationData;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: notificationData.length,
        itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 375),
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: ScaleAnimation(
              child: ItemNotificationWidget(
                notificationData: notificationData[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
