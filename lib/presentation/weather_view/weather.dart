import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather/presentation/weather_view/items.dart';
import '../../constants/constants.dart';

// ignore: must_be_immutable
class Weather extends StatefulWidget {
  String city;
  Weather({
    super.key,
    required this.city,
  });

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: buildBoldText(
          text: 'Weather App',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(Constants.paddingApp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image(
                height: 100,
                image: AssetImage(
                  Constants.splashImge,
                ),
              ),
            ),
            buildBoldText(
              text: '32 ℃',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                widget.city,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.grey,
                ),
              ),
            ),
            buildBoldText(
              text: 'Additional Information',
            ),
            Row(
              children: [
                buildAdditInfo(
                  degree: '13.0',
                  image: '',
                  name: 'Wind Speed',
                ),
                buildAdditInfo(
                  degree: '29.83',
                  image: '',
                  name: 'Pressure',
                ),
              ],
            ),
            SizedBox(
              height: Constants.paddingApp,
            ),
            Row(
              children: [
                buildAdditInfo(
                  degree: '58',
                  image: '',
                  name: 'Humidity',
                ),
                buildAdditInfo(
                  degree: '38.4',
                  image: '',
                  name: 'Max temp',
                ),
              ],
            ),
            const Spacer(),
            buildBoldText(
              text: 'Change your City',
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: DropdownButton<String>(
                menuMaxHeight: 400,
                autofocus: true,
                value: widget.city,
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
                    widget.city = value!;
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
          ],
        ),
      ),
    );
  }
}
