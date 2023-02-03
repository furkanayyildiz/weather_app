import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/screens/weather_screen.dart';

//page imports
import "../cubit/weather_cubit.dart";
import '../cubit/weather_state.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          switch (state.status) {
            case WeatherStatus.inital:
              return searchContainer(context);
            case WeatherStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case WeatherStatus.success:
              return WeatherScreen();

            case WeatherStatus.error:
              print("error");
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  Container searchContainer(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/search_screen_background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  "WEATHER",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              TextField(
                controller: cityController,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                decoration: const InputDecoration(
                  labelText: "Enter City",
                  labelStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: "Enter City",
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      "GET WEATHER",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  context.read<WeatherCubit>().getWeather(cityController.text);
                  setState(() {
                    FocusManager.instance.primaryFocus?.unfocus();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
