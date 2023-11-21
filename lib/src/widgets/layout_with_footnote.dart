import 'package:flutter/widgets.dart';

class LayoutWithFootnote extends StatelessWidget {
  const LayoutWithFootnote(
      {super.key, required this.child, required this.footnote});

  final Widget child;
  final Widget footnote;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        child,
        Positioned(
          bottom: 0,
          child: footnote,
        ),
      ],
    );
  }
}
