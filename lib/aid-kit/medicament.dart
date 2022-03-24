import 'package:flutter/material.dart';

class Medicament extends StatelessWidget {
  final String name;
  final int count;

  const Medicament({Key? key, required this.name, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Medicament counts should all be centerred
    final countWidth = _textSize(
            "$count", const TextStyle(fontFamily: "Poppins", fontSize: 35))
        .width;
    // To shift the count's center change the value of defaultPadding:
    // decrease to the left, increase to the right
    const double defaultPadding = 40;

    return Padding(
      padding: EdgeInsets.fromLTRB(30, 30, defaultPadding - countWidth / 2, 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(fontFamily: "Poppins", fontSize: 35),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  print("Minus");
                },
                child: const Text(
                  "-",
                  style: TextStyle(fontFamily: "Poppins"),
                ),
              ),
              Text(
                "$count",
                style: const TextStyle(fontFamily: "Poppins", fontSize: 35),
              ),
              TextButton(
                onPressed: () {
                  print("Plus");
                },
                child: const Text(
                  "+",
                  style: TextStyle(fontFamily: "Poppins"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // https://stackoverflow.com/questions/52659759/how-can-i-get-the-size-of-the-text-widget-in-flutter
  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
