import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ScrollDestinationsBar extends StatefulWidget {
  ScrollDestinationsBar(
      {super.key, required this.localOnPressed, required this.isButtonEnabled});
  late final Function(String) localOnPressed;
  late final bool isButtonEnabled;

  @override
  State<ScrollDestinationsBar> createState() => _ScrollDestinationsBarState();
}

class _ScrollDestinationsBarState extends State<ScrollDestinationsBar> {
  var isDataBeingFetched = false;

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 2),
      () {
        setState(
          () {
            isDataBeingFetched = true;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "Popular Destinations",
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontFamily: "Emirates"),
          ),
          isDataBeingFetched
              ? Container(
                  color: const Color.fromARGB(255, 12, 11, 7),
                  child: SingleChildScrollView(
                    //Here i make child widget scrollable if it does not fit in the screen
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildCountryContainer("Japan"),
                        _buildCountryContainer("Usa"),
                        _buildCountryContainer("Turkey"),
                        _buildCountryContainer("Italy"),
                        _buildCountryContainer("India"),
                      ],
                    ),
                  ),
                )
              : Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: const Color.fromARGB(255, 126, 110, 110),
                  child: Container(
                    color: const Color.fromARGB(255, 12, 11, 7),
                    child: SingleChildScrollView(
                      
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildCountryContainer("Japan"),
                          _buildCountryContainer("Usa"),
                          _buildCountryContainer("Turkey"),
                          _buildCountryContainer("Italy"),
                          _buildCountryContainer("India"),
                        ],
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }


  //method for creating widgets with our countries
  Widget _buildCountryContainer(String countryName) {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.all(10.0),
      width: 350,
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/$countryName.jpg"),
            fit: BoxFit.fill),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, left: 18.0),
        child: Column(
          mainAxisSize: MainAxisSize
              .min, //встановлюю так , щоб колнка займала мінімальну довжину
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              countryName,
              style: const TextStyle(
                  color: Colors.white, fontSize: 30, fontFamily: "Emirates"),
            ),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: const MaterialStatePropertyAll(Size(105, 45)),
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (states) {
                    if (widget.isButtonEnabled) {
                      return const Color.fromARGB(255, 194, 6, 6);
                    } else {
                      return const Color.fromARGB(255, 124, 124, 124);
                    }
                  },
                ),
              ),
              onPressed: widget.isButtonEnabled
                  ? () {
                      widget.localOnPressed(countryName);
                    }
                  : null,
              child: const Text(
                "Book",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Emirates",
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            )
          ],
        ),
      ),
    );
  }
}
