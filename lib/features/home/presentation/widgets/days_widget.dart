import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_flutter_task/core/request_states.dart';
import 'package:weather_flutter_task/features/home/presentation/controller/home_cubit.dart';
import 'package:weather_flutter_task/features/home/presentation/controller/home_states.dart';

class DaysWeather extends StatelessWidget {
  const DaysWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        switch (state.getCityWeatherState) {
          case RequestStates.loading:
            return const SizedBox(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestStates.success:
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 420,
                  color: context.read<HomeCubit>().containerColor,
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          child: Row(
                            children: [
                              Text(DateFormat("EEEE").format(DateFormat("yyyy-MM-dd").parse(
                                  state.weatherResponse?.forecast?.forecastday?[index].date ??
                                      ""))),
                              const Spacer(),
                              const Icon(Icons.water_drop, size: 13),
                              Text(
                                '${state.weatherResponse?.forecast?.forecastday?[index].day?.dailyChanceOfRain}%',
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                "assets/images/sun.png",
                                height: 25,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                "assets/images/moon.gif",
                                height: 25,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                  "${state.weatherResponse?.forecast?.forecastday?[index].day?.maxTempC?.floor()}°"),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                  "${state.weatherResponse?.forecast?.forecastday?[index].day?.minTempC?.floor()}°"),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 8,
                          ),
                      itemCount: state.weatherResponse?.forecast?.forecastday?.length ?? 0),
                ),
              ),
            );
          case RequestStates.error:
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Image.asset(
                  "assets/images/error.png",
                  height: 300,
                  fit: BoxFit.scaleDown,
                ),
              ),
            );
        }
      },
    );
  }
}
