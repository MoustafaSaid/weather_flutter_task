import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_task/core/request_states.dart';
import 'package:weather_flutter_task/features/home/domain/repo/home_repo.dart';
import 'package:weather_flutter_task/features/home/presentation/controller/home_states.dart';
import 'package:location/location.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit({required this.homeRepo}) : super(const HomeStates());
  HomeRepo homeRepo;
  TextEditingController searchController = TextEditingController();
  getWeather({required double lat, required double lon}) async {
    var response = await homeRepo.getCurrentLocationWeather(lat: lat, lon: lon);
    response.fold((l) {
      emit(state.copyWith(getCityWeatherState: RequestStates.error, error: l.message));
    }, (r) {
      Future.delayed(const Duration(milliseconds: 500)).then((value) =>
          emit(state.copyWith(getCityWeatherState: RequestStates.success, weatherResponse: r)));
    });
  }

  getCityWeather() async {
    emit(state.copyWith(getCityWeatherState: RequestStates.loading));
    var response = await homeRepo.getCityWeather(cityName: searchController.text);
    response.fold((l) {
      emit(state.copyWith(getCityWeatherState: RequestStates.error, error: l.message));
      searchController.clear();
    }, (r) {
      Future.delayed(const Duration(milliseconds: 500)).then((value) =>
          emit(state.copyWith(getCityWeatherState: RequestStates.success, weatherResponse: r)));
      ;
      searchController.clear();
    });
  }

  Location location = Location();
  bool _serviceEnabled = false;
  late PermissionStatus _permissionGranted;
  late LocationData locationData;
  bool isListenLocation = false;
  bool isGetLocation = false;

  getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    emit(state.copyWith(
        getLocationState: RequestStates.success,
        lon: locationData.longitude,
        lat: locationData.latitude));
    getWeather(lat: state.lat, lon: state.lon);

    isGetLocation = true;
  }

  ScrollController scrollController = ScrollController();
  bool result = false;

  isCollapsed() {
    scrollController.notifyListeners();
    result = scrollController.hasClients && scrollController.offset > (230 - 56.0);
    if (result != false) {}

    return result;
  }

  var textColor = Colors.black;
  var firsContainerColor = const Color.fromRGBO(132, 168, 230, 1);
  var containerColor = Colors.blue[50];
  Color appbarColor = Colors.blueAccent;
  Color scaffoldColor = Colors.blueAccent;

  changeColor() {
    textColor = textColor == Colors.black ? Colors.white : Colors.black;
    appbarColor = appbarColor == Colors.blueAccent ? Colors.black : Colors.blueAccent;
    scaffoldColor = scaffoldColor == Colors.blueAccent ? Colors.black : Colors.blueAccent;
    containerColor = containerColor == Colors.blue[50] ? Colors.white70 : Colors.blue[50];
    emit(state.copyWith(
        themeState: state.themeState == ThemeState.light ? ThemeState.dark : ThemeState.light));
  }
}
