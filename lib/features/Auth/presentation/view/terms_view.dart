import 'package:flutter/material.dart';
import 'package:test/core/utils/helper.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/web_view.dart';

class TermsView extends StatelessWidget {
  const TermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return WebViewScreen(
      url: EndPoints.terms,
      title: context.textTr(AppStrings.terms),
    );
  }
}
