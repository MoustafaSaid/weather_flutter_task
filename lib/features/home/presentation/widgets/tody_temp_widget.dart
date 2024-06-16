import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_task/features/home/presentation/controller/home_cubit.dart';
import 'package:weather_flutter_task/features/home/presentation/controller/home_states.dart';

class TodayTempWidget extends StatelessWidget {
  const TodayTempWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 100,
              color: context.read<HomeCubit>().containerColor,
              child: const Column(
                children: [
                  Text('Today\'s Temperature', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 4),
                  Text('Expect the same as yesterday',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
