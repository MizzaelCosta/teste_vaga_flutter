import 'package:flutter/material.dart';

import '../constants/color.dart' as color;
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
                    color.gradientTop,
                    color.gradientBotton,
                  ],
                ),
              ),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  child,
                  Positioned(
                    bottom: 0,
                    child: PrivacyPolicy(context),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
