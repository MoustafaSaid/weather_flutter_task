import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_task/features/home/presentation/controller/home_cubit.dart';
import 'package:weather_flutter_task/features/home/presentation/controller/home_states.dart';
import 'package:weather_flutter_task/features/home/presentation/widgets/app_bar_title_widget.dart';
import 'package:weather_flutter_task/features/home/presentation/widgets/days_widget.dart';
import 'package:weather_flutter_task/features/home/presentation/widgets/home_drawer_widget.dart';
import 'package:weather_flutter_task/features/home/presentation/widgets/hours_widget.dart';
import 'package:weather_flutter_task/features/home/presentation/widgets/sun_state_widget.dart';
import 'package:weather_flutter_task/features/home/presentation/widgets/tody_temp_widget.dart';
import 'package:weather_flutter_task/features/home/presentation/widgets/weather_states_widget.dart';

import '../widgets/app_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: cubit.scaffoldColor,
          drawer: BlocBuilder<HomeCubit, HomeStates>(
            builder: (context, state) {
              return HomeDrawer(
                cityName: state.weatherResponse?.location?.name ?? "",
                temp: state.weatherResponse?.current?.feelslikeC?.floor().toString() ?? "",
              );
            },
          ),
          body: BlocConsumer<HomeCubit, HomeStates>(
            listener: (context, state) {
              // if (state.getLocationState == RequestStates.success) {
              //   cubit.getWeather(lat: state.lat, lon: state.lon);
              // }
            },
            builder: (context, state) {
              // switch (state.getWeatherState) {
              //   case RequestStates.error:
              //     return const SizedBox(
              //       height: 200,
              //       child: Center(
              //         child: CircularProgressIndicator(),
              //       ),
              //     );
              //   case RequestStates.success:
              //     return CustomScrollView(
              //       controller: cubit.scrollController,
              //       slivers: [
              //         SliverAppBar(
              //           title: HomeAppBarTitleWidget(cubit: cubit),
              //           elevation: 0,
              //           // collapsedHeight: 80,
              //           pinned: true,
              //           systemOverlayStyle: const SystemUiOverlayStyle(
              //               statusBarBrightness: Brightness.light,
              //               statusBarIconBrightness: Brightness.light,
              //               statusBarColor: Colors.transparent),
              //           backgroundColor: cubit.appbarColor,
              //           expandedHeight: 300,
              //           // floating: true,
              //           // title: Text("El Hay El Asher",),
              //
              //           flexibleSpace: HomeAppBarWidget(cubit: cubit),
              //         ),
              //         const SliverToBoxAdapter(
              //           child: HoursWeather(),
              //         ),
              //         const SliverToBoxAdapter(
              //           child: TodayTempWidget(),
              //         ),
              //         const SliverToBoxAdapter(
              //           child: DaysWeather(),
              //         ),
              //         const SliverToBoxAdapter(
              //           child: SunStateWidget(),
              //         ),
              //         const SliverToBoxAdapter(
              //           child: WeatherStatesWidget(),
              //         ),
              //       ],
              //     );
              //   case RequestStates.error:
              //     return Padding(
              //       padding: const EdgeInsets.all(15.0),
              //       child: Center(
              //         child: Image.asset(
              //           "assets/images/error.png",
              //           height: 300,
              //           fit: BoxFit.scaleDown,
              //         ),
              //       ),
              //     );
              // }
              return CustomScrollView(
                controller: cubit.scrollController,
                slivers: [
                  SliverAppBar(
                    title: HomeAppBarTitleWidget(cubit: cubit),
                    elevation: 0,
                    // collapsedHeight: 80,
                    pinned: true,
                    systemOverlayStyle: const SystemUiOverlayStyle(
                        statusBarBrightness: Brightness.light,
                        statusBarIconBrightness: Brightness.light,
                        statusBarColor: Colors.transparent),
                    backgroundColor: cubit.appbarColor,
                    expandedHeight: 300,
                    // floating: true,
                    // title: Text("El Hay El Asher",),

                    flexibleSpace: HomeAppBarWidget(cubit: cubit),
                  ),
                  const SliverToBoxAdapter(
                    child: HoursWeather(),
                  ),
                  const SliverToBoxAdapter(
                    child: TodayTempWidget(),
                  ),
                  const SliverToBoxAdapter(
                    child: DaysWeather(),
                  ),
                  const SliverToBoxAdapter(
                    child: SunStateWidget(),
                  ),
                  const SliverToBoxAdapter(
                    child: WeatherStatesWidget(),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
