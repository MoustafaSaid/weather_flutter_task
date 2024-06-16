import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_task/features/home/presentation/controller/home_cubit.dart';
import 'package:weather_flutter_task/features/home/presentation/controller/home_states.dart';

class HomeAppBarTitleWidget extends StatelessWidget {
  const HomeAppBarTitleWidget({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              "${cubit.isCollapsed() ? state.weatherResponse?.location?.name : ""}",
              style: TextStyle(color: cubit.textColor),
            ),
            if (cubit.isCollapsed())
              Icon(
                Icons.location_on_sharp,
                size: 18,
                color: cubit.textColor,
              ),
          ],
        );
      },
    );
  }
}
