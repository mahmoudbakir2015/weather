import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/business_logic/cubit/app_cubit.dart';
import 'package:weather/data/repository/app_repo.dart';
import 'package:weather/data/web_service/app_service.dart';
import 'package:weather/helpers/cache_helper.dart';
import 'package:weather/helpers/dio_helper.dart';
import 'package:weather/helpers/observer.dart';
import 'package:weather/presentation/splash_view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await DioHelper.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(
          appRepo: AppRepo(
        appWebService: AppWebService(),
      )),
      child: const MaterialApp(
        title: 'WeatherApp',
        debugShowCheckedModeBanner: false,
        home: SplashView(),
      ),
    );
  }
}
