import 'package:url_launcher/url_launcher.dart';

import '../app_colors.dart';
import 'custom_snack_bar.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await launchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      customSnackBar(
        context,
        body: 'Cannot launch $url',
        backgroundColor: AppColors.errorColor,
        sideColor: AppColors.errorSecondaryColor,
      );
    }
  }
}
