import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/business_logic/cubit/app_states.dart';

class AppCubit extends Cubit<AppeStates> {
  AppCubit()
      : super(
          InitialState(),
        );
  static AppCubit get(context) => BlocProvider.of(context);
}
