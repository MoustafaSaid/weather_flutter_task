import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_task/core/request_states.dart';
import 'package:weather_flutter_task/features/home/presentation/controller/home_cubit.dart';
import 'package:weather_flutter_task/features/home/presentation/controller/home_states.dart';

class WeatherStatesWidget extends StatelessWidget {
  const WeatherStatesWidget({super.key});

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
                  height: 115,
                  padding: const EdgeInsets.all(12),
                  color: context.read<HomeCubit>().containerColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/uv_index.png",
                            height: 40,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('UV index'),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('${state.weatherResponse?.current?.uv}'),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/wind.png",
                            height: 40,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('Wind'),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('${state.weatherResponse?.current?.windKph} km/h'),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/humidity.png",
                            height: 40,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('Humidity'),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('${state.weatherResponse?.current?.humidity}%'),
                        ],
                      ),
                    ],
                  ),
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
