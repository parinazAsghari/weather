import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/weather_api.dart';
import '../../models/weather_forecast_hourly.dart';
import '../../utils/constants.dart';

class MainScreenWidget extends StatefulWidget {
   MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {


  String cityName = '';
  WeatherForecastModel model = WeatherForecastModel();



  Future<void> callWeatherApi() async {

    model = await WeatherApi().fetchWeatherForecast(cityName: 'Tehran');
    if(model.forecast!=null){
      print(model);

      setState(() {});
    }

  }

  @override
  void initState() {
    super.initState();
    callWeatherApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: model.forecast!=null ? ViewWidget(model: model,) : Center(child: CircularProgressIndicator())
    );
  }
}

class ViewWidget extends StatelessWidget {
  WeatherForecastModel? model;
  ViewWidget({this.model});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  SizedBox(height: 70),
                  CityInfoWidget(model: model,),
                  SizedBox(height: 15),
                  CarouselWidget(model: model),
                  SizedBox(height: 15),
                  WindWidget(model: model,),
                  SizedBox(height: 15),
                  BarometerWidget(model: model,),
                ]),
          ),
          HeaderWidget(model: model,),
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {

  WeatherForecastModel? model;
  HeaderWidget({this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              // onChanged: ((value) => model.cityName = value),
              // onSubmitted: (_) => model.onSubmitSearch(),
              decoration: InputDecoration(
                filled: true,
                fillColor: bgGreyColor.withAlpha(235),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.blue.withAlpha(135)),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search, color: Colors.blue),
                  // onPressed: model.onSubmitSearch,
                  onPressed: (){},
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: bgGreyColor.withAlpha(235),
            ),
            child: IconButton(
              padding: const EdgeInsets.all(12),
              iconSize: 26,
              // onPressed: model.onSubmitLocate,
              onPressed: (){},
              icon: const Icon(Icons.location_on_outlined, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}

class CityInfoWidget extends StatelessWidget {
  WeatherForecastModel? model;
  CityInfoWidget({this.model});

  @override
  Widget build(BuildContext context) {
    final snapshot = model;
    var city = snapshot!.location?.name;
    var temp = snapshot.current?.tempC!.round();
    var feelTemp = snapshot.current?.feelslikeC;
    var windDegree = snapshot.current?.windDegree;
    var url =
        'https://${((snapshot.current!.condition!.icon).toString().substring(2)).replaceAll("64", "128")}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(url, scale: 1.2),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appText(
              size: 30,
              text: '$city',
              isBold: FontWeight.bold,
              color: primaryColor,
            ),
            RotationTransition(
              turns: AlwaysStoppedAnimation(windDegree! / 360),
              child: const Icon(Icons.north, color: primaryColor),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appText(
              size: 70,
              text: '$temp°',
            ),
            appText(size: 20, text: '$feelTemp°', color: darkGreyColor),
          ],
        ),
      ],
    );
  }
}

class BarometerWidget extends StatelessWidget {

  WeatherForecastModel? model;
  BarometerWidget({this.model});

  @override
  Widget build(BuildContext context) {
    final snapshot = model;
    var temperature = snapshot!.current?.tempC;
    var humidity = snapshot.current?.humidity;
    var pressure = snapshot.current?.pressureMb;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: appText(
              size: 20,
              color: primaryColor.withOpacity(.8),
              text: 'Barometer',
              isBold: FontWeight.bold,
            ),
          ),
          Card(
            color: bgGreyColor,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customListTile(
                    first: 'Temperature:',
                    second: ' $temperature °C',
                    icon: Icons.thermostat,
                    iconColor: Colors.orange,
                  ),
                  customListTile(
                    first: 'Humidity:',
                    second: ' $humidity %',
                    icon: Icons.water_drop_outlined,
                    iconColor: Colors.blueGrey,
                  ),
                  customListTile(
                    first: 'Pressure:',
                    second: ' $pressure hPa',
                    icon: Icons.speed,
                    iconColor: Colors.red[300]!,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WindWidget extends StatelessWidget {
  WeatherForecastModel? model;
  WindWidget({this.model});


  @override
  Widget build(BuildContext context) {
    final snapshot = model;
    var speed = snapshot!.current?.windKph;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: appText(
              size: 20,
              color: primaryColor.withOpacity(.8),
              text: 'Wind',
              isBold: FontWeight.bold,
            ),
          ),
          Card(
            color: bgGreyColor,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customListTile(
                    text: snapshot.current!.windDir!,
                    first: 'Speed:',
                    second: ' $speed km/h',
                    icon: Icons.air,
                    iconColor: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselWidget extends StatelessWidget {
  WeatherForecastModel? model;
  CarouselWidget({this.model});



  @override
  Widget build(BuildContext context) {
    final snapshot = model;

    return SizedBox(
      height: 100,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 23,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) {
          return Container(
            margin: index == 0 ? const EdgeInsets.only(left: 20) : null,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  index < 11
                      ? appText(
                          size: 14,
                          text: '${index + 1} am',
                          color: primaryColor)
                      : index == 11
                          ? appText(
                              size: 14,
                              text: '${index + 1} pm',
                              color: primaryColor)
                          : appText(
                              size: 14,
                              text: '${index - 11} pm',
                              color: primaryColor),
                  const SizedBox(height: 10),
                  Image.network(
                      'https://${(snapshot!.forecast!.forecastday![0].hour![index].condition!.icon).toString().substring(2)}',
                      scale: 2),
                  const SizedBox(height: 5),
                  appText(
                    size: 14,
                    text:
                        '${snapshot.forecast!.forecastday![0].hour![index].tempC}°',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
