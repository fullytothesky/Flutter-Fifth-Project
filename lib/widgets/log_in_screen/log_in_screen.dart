import 'package:flutter/material.dart';
import 'package:state_fifth_project/widgets/countries_screen/countries_page.dart';

class LogInWidget extends StatelessWidget {
  const LogInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/emiratesopening.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 49, 8, 52),
                    Color.fromARGB(255, 38, 26, 56),
                    Color.fromARGB(255, 53, 29, 75)
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("All Journeys Start Here",
                      style: TextStyle(
                          fontFamily: "Emirates",
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w800,
                          fontSize: 35)),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 228, 2, 2)),
                      minimumSize: MaterialStateProperty.all(
                        const Size(150, 50),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CountriesWidget()));
                    },
                    child: const Text(
                      "Explore",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: "Emirates"),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
