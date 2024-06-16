import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_task/core/request_states.dart';
import 'package:weather_flutter_task/features/home/presentation/controller/home_cubit.dart';
import 'package:weather_flutter_task/features/home/presentation/controller/home_states.dart';

class SunStateWidget extends StatelessWidget {
  const SunStateWidget({super.key});

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
                  padding: const EdgeInsets.all(20),
                  height: 220,
                  color: context.read<HomeCubit>().containerColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text("sunrise",
                              style: TextStyle(
                                fontSize: 20,
                              )),
                          Text("${state.weatherResponse?.forecast?.forecastday?[0].astro?.sunrise}",
                              style: const TextStyle()),
                          Image.asset(
                            "assets/images/sunrise.png",
                            height: 120,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text("sunset", style: TextStyle(fontSize: 20)),
                          Text("${state.weatherResponse?.forecast?.forecastday?[0].astro?.sunset}",
                              style: const TextStyle()),
                          Image.asset(
                            "assets/images/sunset.png",
                            height: 120,
                          )
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
