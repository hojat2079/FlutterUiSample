import 'package:flutter/material.dart';

class TextSize extends StatelessWidget {
  final String text;
  final Color color;

  const TextSize({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = _sizeText(text);
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          softWrap: false,
          maxLines: 1,
          overflow: TextOverflow.clip,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            for (int i = 0; i < _size.width / 5; i++)
              Container(
                width: 5,
                color: i.isEven ? color : Colors.white,
                height: 2,
              )
          ],
        )
      ],
    );
  }

  Size _sizeText(String text) {
    final textPainter = TextPainter(
        text: TextSpan(
            text: text,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            )),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
