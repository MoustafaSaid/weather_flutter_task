import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:weather_flutter_task/core/request_states.dart';
import 'package:weather_flutter_task/features/home/presentation/controller/home_cubit.dart';
import 'package:weather_flutter_task/features/home/presentation/controller/home_states.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        switch (state.getCityWeatherState) {
          case RequestStates.loading:
            return const FlexibleSpaceBar(
              background: SizedBox(
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              // title: ,
              centerTitle: true,
            );
          case RequestStates.success:
            return FlexibleSpaceBar(
              background: Container(
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${state.weatherResponse?.current?.tempC?.floor().toString() ?? ""}°",
                      style: TextStyle(fontSize: 45, color: cubit.textColor),
                    ),
                    Row(
                      children: [
                        // SizedBox(width:300,),
                        Text(state.weatherResponse?.location?.name ?? "",
                            style: TextStyle(fontSize: 20, color: cubit.textColor)),
                        Icon(
                          Icons.location_on_sharp,
                          size: 18,
                          color: cubit.textColor,
                        ),

                        const Spacer(),
                        if (state.weatherResponse?.current?.isDay == 1)
                          Image.asset(
                            "assets/images/sun.png",
                            height: 70,
                            width: 70,
                          ),
                        if (state.weatherResponse?.current?.isDay == 0)
                          Image.asset(
                            "assets/images/moon.gif",
                            height: 70,
                            width: 70,
                          ),
                      ],
                    ),

                    Text(
                        '${state.weatherResponse?.forecast?.forecastday?[0].day?.maxTempC?.floor()}° / ${state.weatherResponse?.forecast?.forecastday?[0].day?.minTempC?.floor()}° Feels like ${state.weatherResponse?.current?.feelslikeC?.floor()}°',
                        style: TextStyle(fontSize: 20, color: cubit.textColor)),
                    // const Text('Wed, 1.36 am°',
                    //     style: TextStyle(fontSize: 20)),
                    // DateFormat ("MM, hh:ss a).format(date);
                    Text(
                        "${DateFormat("EEEE").format(DateFormat("yyyy-MM-dd").parse(state.weatherResponse?.forecast?.forecastday?[0].date ?? ""))} ${DateFormat('hh:mm a').format(DateFormat("yyyy-MM-dd HH:mm").parse(state.weatherResponse?.current?.lastUpdated ?? ""))}",
                        style: TextStyle(fontSize: 20, color: cubit.textColor)),
                  ],
                ),
              ),
              // title: ,
              centerTitle: true,
            );
          case RequestStates.error:
            return FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Image.asset(
                    "assets/images/error.png",
                    height: 300,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              // title: ,
              centerTitle: true,
            );
        }
      },
    );
  }
}
