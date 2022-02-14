import 'package:flutter/material.dart';

class CustomKeyboardWidget extends StatelessWidget {
  const CustomKeyboardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> firstRow = ["A", "Z", "E", "R", "T", "Y", "U", "I", "O", "P"];
    List<String> secondRow = ["Q", "S", "D", "F", "G", "H", "J", "K", "L", "M"];
    List<String> thirdRow = ["W", "X", "C", "V", "B", "N"];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...firstRow.map(
              (letter) => CustomKey(
              text: letter,
              onTap: () {
              })
            )
          ],
        )
      ],
    );
  }
}
