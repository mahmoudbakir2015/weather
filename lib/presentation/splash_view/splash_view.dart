import 'package:flutter/material.dart';

import '../choose_city/city.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(
      seconds: 3,
    )).then(
      (value) => Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const City(),
        ),
        (route) => false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage(
                'assets/images/splash.jpeg',
              ),
            ),
          )
        ],
      ),
    );
  }
}
