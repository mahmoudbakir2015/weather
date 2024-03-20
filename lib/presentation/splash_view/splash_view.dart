import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather/helpers/cache_helper.dart';
import 'package:weather/presentation/weather_view/weather.dart';

import '../../constants/constants.dart';
import '../choose_city/city.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  String city = '';
  @override
  void initState() {
    Future.delayed(const Duration(
      seconds: 3,
    )).then(
      (value) async {
        await CacheHelper.getData(key: 'city').then(
          (value) => city = value!,
        );
        if (await CacheHelper.getData(key: 'city') != null) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => Weather(
                city: city,
              ),
            ),
            (route) => false,
          );
        } else {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const City(),
            ),
            (route) => false,
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage(
                Constants.splashImge,
              ),
            ),
          )
        ],
      ),
    );
  }
}
