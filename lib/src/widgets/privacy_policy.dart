import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/style.dart';
import '../constants/text.dart';
import 'show_message.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy(
    this.context, {
    super.key,
  });

  final BuildContext context;

  Future<void> _open() async {
    try {
      //TODO: injetar dependência (launchUrl).
      final url = Uri.parse(privacyPolicyUrl);
      await launchUrl(url);
    } catch (e) {
      _showError();
      debugPrint('$e');
    }
  }

  _showError() {
    Message.showSnackBarError(
      context: context,
      message: privacyPolicyErrorMessage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _open();
      },
      child: const Text(
        privacyPolicyLabel,
        style: textStyleWhite,
      ),
    );
  }
}
