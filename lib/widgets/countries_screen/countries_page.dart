import "package:flutter/material.dart";
import "package:state_fifth_project/widgets/countries_screen/choosedcountryview_widget.dart";
import "package:state_fifth_project/widgets/countries_screen/decision_widget.dart";
import "package:state_fifth_project/widgets/countries_screen/scroll_distinations_bar.dart";

//The main Stateful Widget that will manage the state of his child widgets
class CountriesWidget extends StatefulWidget {
  const CountriesWidget({super.key});

  @override
  State<CountriesWidget> createState() => _CountriesWidgetState();
}

class _CountriesWidgetState extends State<CountriesWidget> {
  String choosedCountry = "";
  bool buttonEnabled = true;
  bool isLifted = false;
  void addCountryOnClicking(country) {
    setState(
      () {
        choosedCountry = country;
        buttonEnabled = false;
      },
    );
  }

  void cancelChoice() {
    setState(
      () {
        buttonEnabled = true;
        isLifted = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 24, 23, 23),
        title: const Text(
          "Fly better with Emirates",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: "Emirates",
              fontStyle: FontStyle.italic),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 31, 27, 36),
        child: Column(
          children: [
            ScrollDestinationsBar(
              localOnPressed: addCountryOnClicking,
              isButtonEnabled: buttonEnabled,
            ), //Horizontal ListView with popular destinations

            ChoosedCountryView(
              choice: choosedCountry,
              checked: buttonEnabled,
            ),

            DecisionWidget(
              isChecked: buttonEnabled,
              onPressed: cancelChoice,
            )
          ],
        ),
      ),
    );
  }
}
