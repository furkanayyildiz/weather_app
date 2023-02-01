import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final WeatherService _service = WeatherService();
  late WeatherModel weatherModel = WeatherModel();
  List<Days>? days = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    var data = await _service.fetchWeather();
    if (data != null && data.days != null) {
      setState(() {
        weatherModel = data;
        days = data.days;
        print(weatherModel);
      });
    } else {
      print("EMPTY");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Weather app"),
        ),
        body: Container(
          child: Column(children: [
            //Üst kısım
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    weatherModel == null
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            weatherModel.address.toString().toUpperCase(),
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    days == null || days!.isEmpty
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Text(
                                    days![index].temp.toString(),
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_circle_up),
                                      Text(
                                        days![index].tempmax.toString(),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Icon(Icons.arrow_circle_down),
                                      Text(
                                        days![index].tempmin.toString(),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    days![index].conditions.toString(),
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  Text(
                                    days![index].datetime.toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            //alt kısım
            days == null || days!.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          weatherCard(
                              "Felt Tempature",
                              days![index].feelslike.toString(),
                              Icons.thermostat),
                          weatherCard(
                              "Humadity",
                              days![index].humidity.toString(),
                              Icons.water_drop),
                          weatherCard("Sun-Rise",
                              days![index].sunrise.toString(), Icons.sunny),
                          weatherCard("Sun-Set", days![index].sunset.toString(),
                              Icons.sunny),
                        ],
                      );
                    },
                  )
          ]),
        ),
      ),
    );
  }

  Card weatherCard(String title, String value, IconData icon) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: Text(value),
      ),
    );
  }
}
//Text(days![0].temp.toString())
