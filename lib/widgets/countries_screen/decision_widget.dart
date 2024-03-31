import "package:flutter/material.dart";

class DecisionWidget extends StatelessWidget {
  DecisionWidget({super.key, required this.onPressed, required this.isChecked});

  late final Function() onPressed;
  late final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: const MaterialStatePropertyAll(Size(105, 55)),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (!isChecked) {
                      return const Color.fromARGB(251, 54, 50, 50);
                    } else {
                      return const Color.fromARGB(66, 188, 175, 175);
                    }
                  },
                ),
              ),
              onPressed: !isChecked
                  ? () {
                      onPressed();
                    }
                  : null,
              child: const Text(
                "Cancel",
                style: TextStyle(
                    color: Colors.white, fontFamily: "Emirates", fontSize: 30),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: const MaterialStatePropertyAll(Size(105, 55)),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (!isChecked) {
                      return const Color.fromARGB(255, 239, 2, 2);
                    } else {
                      return const Color.fromARGB(66, 188, 175, 175);
                    }
                  },
                ),
              ),
              onPressed: !isChecked ? () {} : null,
              child: const Text(
                "Continue",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Emirates",
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}