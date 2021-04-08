import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class TextIcon extends StatelessWidget {
  static String tag = '/TextIcon';
  final String text;
  final TextStyle textStyle;
  final Widget prefix;
  final Widget suffix;
  final int spacing;
  final int maxLine;

  TextIcon({this.text, this.textStyle, this.prefix, this.suffix, this.spacing = 4, this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          prefix != null ? Row(children: [prefix, spacing.width]) : SizedBox(),
          Text(text, style: textStyle ?? primaryTextStyle(), maxLines: maxLine ?? 1, overflow: TextOverflow.ellipsis),
          suffix != null ? Row(children: [spacing.width, suffix]) : SizedBox(),
        ],
      ),
    );
  }
}
