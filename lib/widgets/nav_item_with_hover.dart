import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import '../constants/styles.dart';

class InteractiveNavItem extends MouseRegion {
  static final appContainer =
  html.window.document.querySelectorAll('flt-glass-pane')[0];

  InteractiveNavItem(
      { required String text, required String routeName, required bool selected})
      : super(
    onHover: (PointerHoverEvent evt) {
      appContainer.style.cursor = 'pointer';
    },
    onExit: (PointerExitEvent evt) {
      appContainer.style.cursor = 'default';
    },
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 48,vertical: 16),
      child: InteractiveText(
        text: text,
        routeName: routeName,
        selected: selected,
      ),
    ),
  );
}

class InteractiveText extends StatefulWidget {
  final String text;
  final String routeName;
  final bool selected;

  const InteractiveText({
    required this.text,
    required this.routeName,
    required this.selected,
  });

  @override
  InteractiveTextState createState() => InteractiveTextState();
}

class InteractiveTextState extends State<InteractiveText> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) => _hovered(true),
      onExit: (_) => _hovered(false),
      child: Text(widget.text,
          style: _hovering
              ? kPageTitleStyle.copyWith(
            fontSize: menuItemFontSize + 4,
              color: primaryColor,
             )
              : (widget.selected)
              ? kPageTitleStyle.copyWith(color: primaryColor,)
              : kPageTitleStyle),
    );
  }

  _hovered(bool hovered) {
    setState(() {
      _hovering = hovered;
    });
  }
}
