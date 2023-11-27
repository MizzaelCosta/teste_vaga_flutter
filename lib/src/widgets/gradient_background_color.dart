import 'package:flutter/material.dart';
import 'package:teste_vaga_flutter/src/constants/text.dart';

import '../constants/color.dart';
import 'layout_with_footnote.dart';
import 'privacy_policy.dart';

class GradientBackgroundColor extends StatelessWidget {
  const GradientBackgroundColor({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constrints.maxHeight,
              minWidth: constrints.maxWidth,
            ),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    gradientTop,
                    gradientBotton,
                  ],
                ),
              ),
              child: LayoutWithFootnote(
                footnote: PrivacyPolicy(
                  context,
                  url: privacyPolicyUrl,
                ),
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
