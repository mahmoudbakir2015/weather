import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/business_logic/cubit/app_cubit.dart';
import 'package:weather/business_logic/cubit/app_states.dart';
import 'package:weather/helpers/cache_helper.dart';
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
  Map? data;
  @override
  void initState() {
    BlocProvider.of<AppCubit>(context).getWeatherInfo(
      city: widget.city,
    );
    super.initState();
  }

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
          child: BlocBuilder<AppCubit, AppeStates>(
            builder: (context, state) {
              if (state is SuccessedWeatherState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image(
                        image: NetworkImage(
                          'https:${state.weatherModel.current?.condition?.icon}',
                        ),
                      ),
                    ),
                    buildBoldText(
                      text: '${state.weatherModel.current?.tempC} ℃',
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
                          degree: '${state.weatherModel.current?.windKph}',
                          image: Constants.wind,
                          name: 'Wind Speed',
                        ),
                        buildAdditInfo(
                          degree: '${state.weatherModel.current?.pressureIn}',
                          image: Constants.pressure,
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
                          degree: '${state.weatherModel.current?.humidity}',
                          image: Constants.humidity,
                          name: 'Humidity',
                        ),
                        buildAdditInfo(
                          degree: '${state.weatherModel.current?.tempF}',
                          image: Constants.temp,
                          name: 'Temp in Fahrnhit',
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
                        onChanged: (String? value) async {
                          // This is called when the user selects an item.
                          setState(() {
                            widget.city = value!;
                          });
                          await CacheHelper.saveData(
                            value: value.toString(),
                            key: 'city',
                          );
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => Weather(
                                city: value!,
                              ),
                            ),
                            (route) => false,
                          );
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
                );
              }
              if (state is FailedWeatherState) {
                return Center(
                  child: Text(
                    state.errorMessage,
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
