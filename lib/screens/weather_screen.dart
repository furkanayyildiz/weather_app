import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

// page imports
import "../cubit/weather_cubit.dart";
import "../cubit/weather_state.dart";

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});
  static const routeName = "/weather_screen";

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather app"),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("assets/images/weather_screen_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(children: [
              //Üst kısım
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  alignment: Alignment.center,
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        state.response == null ||
                                state.response!.days! == null ||
                                state.response!.days!.isEmpty
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    child: Column(
                                      children: [
                                        Text(
                                          state.response!.address!
                                              .toString()
                                              .toUpperCase(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          state.response!.days![index].temp
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 50,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.arrow_circle_up,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              state.response!.days![index]
                                                  .tempmax
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Icon(
                                              Icons.arrow_circle_down,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              state.response!.days![index]
                                                  .tempmin
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          state
                                              .response!.days![index].conditions
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        Text(
                                          state.response!.days![index].datetime
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              //alt kısım
              state.response!.days! == null || state.response!.days!.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: 1,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: Column(
                            children: [
                              weatherCard(
                                  "Felt Tempature",
                                  state.response!.days![index].feelslike
                                      .toString(),
                                  Icons.thermostat),
                              weatherCard(
                                  "Humadity",
                                  state.response!.days![index].humidity
                                      .toString(),
                                  Icons.water_drop),
                              weatherCard(
                                  "Sun-Rise",
                                  state.response!.days![index].sunrise
                                      .toString(),
                                  Icons.sunny),
                              weatherCard(
                                  "Sun-Set",
                                  state.response!.days![index].sunset
                                      .toString(),
                                  Icons.sunny),
                            ],
                          ),
                        );
                      },
                    )
            ]),
          );
        },
      ),
    );
  }

  Card weatherCard(String title, String value, IconData icon) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
