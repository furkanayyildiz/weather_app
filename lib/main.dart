import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// page imports
import './screens/weather_screen.dart';
import './screens/search_screen.dart';
import './cubit/weather_cubit.dart';
import './service/weather_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(
          create: (context) => WeatherCubit(WeatherService()),
          child: SearchScreen(),
        ),
        BlocProvider<WeatherCubit>(
          create: (context) => WeatherCubit(WeatherService()),
          child: WeatherScreen(),
        )
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SearchScreen(),
        routes: {
          WeatherScreen.routeName: (context) => WeatherScreen(),
        },
      ),
    );
  }
}
