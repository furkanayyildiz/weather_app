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
      home: Scaffold(
        appBar: AppBar(
          title: Text("Weather app"),
        ),
        body: Container(
          child: Column(children: [
            //Üst kısım
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weatherModel.address.toString().toUpperCase(),
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      days![0].temp.toString(),
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
                          days![0].tempmax.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(Icons.arrow_circle_down),
                        Text(
                          days![0].tempmin.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Text(
                      days![0].conditions.toString(),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            //alt kısım
            Expanded(
              child: Column(
                children: [
                  weatherCard("Felt Tempature", days![0].feelslike.toString(),
                      Icons.thermostat),
                  weatherCard("Humadity", days![0].humidity.toString(),
                      Icons.water_drop),
                  weatherCard(
                      "Sun-Rise", days![0].sunrise.toString(), Icons.sunny),
                  weatherCard(
                      "Sun-Set", days![0].sunset.toString(), Icons.sunny),
                ],
              ),
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
