import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_task/core/di/injection_container.dart';
import 'package:weather_flutter_task/core/helper/observer.dart';
import 'package:weather_flutter_task/features/home/presentation/controller/home_cubit.dart';
import 'package:weather_flutter_task/features/home/presentation/pages/home.dart';
import 'core//di/injection_container.dart' as di;

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (context) => sl<HomeCubit>()..getLocation(), child: const HomePage()),
    );
  }
}
