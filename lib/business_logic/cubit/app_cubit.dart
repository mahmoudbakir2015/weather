import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/business_logic/cubit/app_states.dart';
import '../../data/repository/app_repo.dart';

class AppCubit extends Cubit<AppeStates> {
  final AppRepo appRepo;
  AppCubit({required this.appRepo})
      : super(
          InitialState(),
        );
  static AppCubit get(context) => BlocProvider.of(context);

  getWeatherInfo({required String city}) {
    appRepo
        .getWeatherInfo(city: city)
        .then(
          (value) => emit(
            SuccessedWeatherState(
              weatherModel: value,
            ),
          ),
        )
        .catchError(
      (error) {
        emit(
          FailedWeatherState(
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }
}
