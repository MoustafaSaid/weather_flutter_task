import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_task/features/home/presentation/controller/home_cubit.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.cityName, required this.temp});
  final String cityName;
  final String temp;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(49, 57, 67, 1),
      // rgb(49,57,67)
      shape: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius:
            BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                context.read<HomeCubit>().changeColor();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.nights_stay_outlined),
              color: Colors.white,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Current Location",
                  style: TextStyle(color: Colors.white),
                ),
                // s(width: 10,),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const SizedBox(
                  width: 40,
                ),

                const SizedBox(
                  width: 10,
                ),
                Text(
                  // context.read<HomeCubit>(.weather!.location.cityName,
                  cityName,
                  style: const TextStyle(color: Colors.white),
                ),
                // s(width: 10,),
                const SizedBox(
                  width: 40,
                ),
                InkWell(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/moon.gif',
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        // context.read<HomeCubit>(.weather!.current.temp.toString() + "°",
                        "$temp°",
                        style: const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: context.read<HomeCubit>().searchController,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  suffixIcon: InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: const Text(
                          "Search",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap: () {
                        context.read<HomeCubit>().getCityWeather();
                        Navigator.pop(context);
                      }),
                  hintText: "City Name",
                  hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blue))),
            ),
          ),
        ],
      ),
    );
  }
}
