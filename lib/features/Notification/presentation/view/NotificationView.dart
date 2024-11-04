import 'package:flutter/material.dart';
import 'package:test/core/utils/helper.dart';
import 'package:test/core/widgets/custom_app_bar.dart';

import '../../../../core/utils/app_string.dart';
import '../widgets/NotificationViewBody.dart';
import '../widgets/NotificationViewBodyBlocBuilder.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: context.textTr(AppStrings.notifications),
        context: context,
      ),
      body: const NotificationViewBodyBlocBuilder(),
    );
  }
}
