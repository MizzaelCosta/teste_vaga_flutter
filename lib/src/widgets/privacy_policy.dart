import 'package:flutter/material.dart';
import 'package:teste_vaga_flutter/src/constants/style.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/color.dart';
import '../constants/text.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy(
    this.context, {
    super.key,
  });

  final BuildContext context;

  Future<void> _openBrowser() async {
    final url = Uri.parse(urlPrivacyPolicy);
    try {
      //TODO: injetar dependência (launchUrl).

      await launchUrl(url);
    } catch (e) {
      debugPrint('$e');
      _snackBarMessage();
    }
  }

  void _snackBarMessage() {
    if (ScaffoldMessenger.of(context).mounted) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(errorMessagePrivacyPolicy),
        showCloseIcon: true,
        closeIconColor: white,
        elevation: 10.0,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _openBrowser();
      },
      child: const Text(
        labelPrivacyPolicy,
        style: textStyleWhite,
      ),
    );
  }
}
