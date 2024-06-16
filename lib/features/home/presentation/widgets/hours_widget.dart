import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_flutter_task/core/request_states.dart';
import 'package:weather_flutter_task/features/home/presentation/controller/home_cubit.dart';
import 'package:weather_flutter_task/features/home/presentation/controller/home_states.dart';

class HoursWeather extends StatelessWidget {
  const HoursWeather({super.key});

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
                  // color: Color.fromRGBO(130, 170, 232 ,1),

                  height: 180,
                  // color: Colors.blue[100],
                  color: context.read<HomeCubit>().containerColor,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 5,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: 24,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10.0),
                        // margin: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(DateFormat('hh a').format(DateFormat("yyyy-MM-dd HH:mm").parse(
                                state.weatherResponse?.forecast?.forecastday?[0].hour?[index]
                                        .time ??
                                    ""))),
                            const SizedBox(height: 10),
                            if (state.weatherResponse?.current?.isDay == 1)
                              Image.asset(
                                "assets/images/sun.png",
                                height: 25,
                                width: 15,
                              ),
                            if (state.weatherResponse?.current?.isDay == 0)
                              Image.asset(
                                "assets/images/moon.gif",
                                height: 25,
                                width: 15,
                              ),
                            // Image.asset("assets/images/sun.png",
                            //     height: 25),
                            const SizedBox(height: 15),
                            Text(
                              '${state.weatherResponse?.forecast?.forecastday?[0].hour?[index].feelslikeC?.floor().toString()}°',
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(Icons.water_drop, size: 13),
                                // SizedBox(width: 3),
                                Text(
                                  '${state.weatherResponse?.forecast?.forecastday?[0].hour?[index].chanceOfRain.toString()}',
                                  style: const TextStyle(fontSize: 18),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
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
