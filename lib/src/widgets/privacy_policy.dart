import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/style.dart';
import '../constants/text.dart';
import 'show_message.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy(
    this.context, {
    required this.url,
    super.key,
  });

  final BuildContext context;
  final String url;

  Future<void> _open(String url) async {
    try {
      //TODO: injetar dependência (launchUrl).
      await launchUrl(Uri.parse(url));
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
        _open(url);
      },
      child: const Text(
        privacyPolicyLabel,
        style: textStyleWhite,
      ),
    );
  }
}
