import 'package:flutter/material.dart';
import 'package:weather/presentation/weather_view/weather.dart';

import '../../constants/constants.dart';

class City extends StatefulWidget {
  const City({super.key});

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  String dropdownValue = Constants.capitalCountry.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
          20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose Your Country',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                wordSpacing: 3,
              ),
            ),
            Center(
              child: Expanded(
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: DropdownButton<String>(
                    menuMaxHeight: 400,
                    autofocus: true,
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    elevation: 16,
                    alignment: Alignment.center,
                    isExpanded: true,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 5,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: Constants.capitalCountry
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        alignment: Alignment.center,
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const Weather(),
                  ),
                  (route) => false,
                );
              },
              child: const Text(
                'Go to Weather',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
