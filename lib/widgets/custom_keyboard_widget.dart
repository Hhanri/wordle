import 'package:flutter/material.dart';
import 'package:wordle/resources/theme.dart';
import 'package:wordle/widgets/custom_key_widget.dart';

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
              (letter) => CustomKeyWidget(
              text: letter,
              onTap: () {
              })
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...secondRow.map(
              (letter) => CustomKeyWidget(
              text: letter,
              onTap: () {
              })
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...thirdRow.map(
              (letter) => CustomKeyWidget(
              text: letter,
              onTap: () {
              })
            ),
            Container(
              width: 90,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: MyShapes.circularBorders,
                color: Colors.transparent,
                boxShadow: MyStyles.shadow
              ),
              margin: const EdgeInsets.all(4),
              child: InkWell(
                onTap: () {
                },
                child: Center(
                  child: Text(
                    'Back',
                    style: MyStyles.textStyle
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
