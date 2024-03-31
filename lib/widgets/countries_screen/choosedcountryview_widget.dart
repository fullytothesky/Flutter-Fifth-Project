import "package:flutter/material.dart";

class ChoosedCountryView extends StatelessWidget {
  late final String choice;
  late final bool checked;
  ChoosedCountryView({super.key, required this.choice, required this.checked});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: checked
          ? RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 25, fontFamily: "Emirates"),
                children: [
                  TextSpan(
                    text: "You ",
                    style: TextStyle(),
                  ),
                  TextSpan(
                    text: "haven't",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: ' choosed any countries')
                ],
              ),
            )
          : RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 25, fontFamily: "Emirates"),
                children: [
                  const TextSpan(
                    text: "You have chosen ",
                    style: TextStyle(),
                  ),
                  TextSpan(
                    text: choice,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
    );
  }
}
