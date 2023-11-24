// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:weather/weather.dart';

// part 'weather_bloc_event.dart';
// part 'weather_bloc_state.dart';

// class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
//   WeatherBlocBloc() : super(WeatherBlocInitial()) {
//     on<FetchWeather>((event, emit) async {
//       emit(WeatherBlocLoading());
//       try {
//         WeatherFactory wf = WeatherFactory(
//           "API_KEY",
//           language: Language.ENGLISH,
//         );
//         // Position position = await Geolocator.getCurrentPosition();
//         Weather weather = await wf.currentWeatherByLocation(
//             event.position.latitude, event.position.longitude);
//         print("weather");
//         emit(WeatherBlocSuccess(weather: weather));
//       } catch (e) {
//         emit(WeatherBlocFaiure());
//       }
//     });
//   }
// }
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoading());
      try {
        WeatherFactory wf = WeatherFactory("3c5be37392420c3683f7a4e774b792bf",
            language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
          event.position.latitude,
          event.position.longitude,
        );
        emit(WeatherBlocSuccess(weather));
      } catch (e) {
        emit(WeatherBlocFaiure());
      }
    });
  }
}
