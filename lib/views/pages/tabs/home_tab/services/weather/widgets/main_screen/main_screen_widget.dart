import 'package:emdad_khodro_saipa/api_provider/provider.dart';
import 'package:emdad_khodro_saipa/models/weather_response_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../constants.dart';


class MainScreenWidget extends StatefulWidget {
   MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {


  String cityName = '';

  WeatherResponseModel weatherModel = WeatherResponseModel();



  Future<void> callWeatherApi() async {

    weatherModel = await ApiProvider.getWeather(LatLng(10.0, 10.0));


    if(weatherModel.current !=null){
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
      body: weatherModel.current !=null ? ViewWidget(model: weatherModel,) : Center(child: CircularProgressIndicator())
    );
  }
}

class ViewWidget extends StatelessWidget {
  WeatherResponseModel? model;
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
                  // CarouselWidget(model: model),
                  // SizedBox(height: 15),
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

  WeatherResponseModel? model;
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
                // filled: true,
                // fillColor: Theme.of(context).primaryColorLight,
                hintText: 'جستجو',
                // hintStyle: TextStyle(color: Colors.blue.withAlpha(135)),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search,
                      // color: Colors.blue
                  ),
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
              // padding: const EdgeInsets.all(12),
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
  WeatherResponseModel? model;
  CityInfoWidget({this.model});

  @override
  Widget build(BuildContext context) {
    final snapshot = model;
    // var city = snapshot!.location?.name;
    var city = 'تهران';
    // var temp = snapshot.current?.tempC!.round();
    var temp = model!.current!.temp!.round();
    // var feelTemp = snapshot.current?.feelslikeC;
    var feelTemp = model!.current!.feelsLike!;
    // var windDegree = snapshot.current?.windDegree;
    var windDegree = model!.current!.windDeg!;
    var url =
        'http://openweathermap.org/img/wn/${model!.current!.weather![0].icon}@2x.png';

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
              turns: AlwaysStoppedAnimation(windDegree / 360),
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

  WeatherResponseModel? model;
  BarometerWidget({this.model});

  @override
  Widget build(BuildContext context) {
    final snapshot = model;
    // var temperature = snapshot!.current?.tempC;
    var temperature = model!.current!.temp!;
    // var humidity = snapshot.current?.humidity;
    var humidity = model!.current!.humidity!;
    // var pressure = snapshot.current?.pressureMb;
    var pressure = model!.current!.pressure!;
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
              text: 'فشارسنج',
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
                    first: 'دما (درجه سانتیگراد): ',
                    second: ' $temperature ',
                    icon: Icons.thermostat,
                    iconColor: Colors.orange,
                  ),
                  customListTile(
                    first: 'رطوبت: ',
                    second: ' % $humidity',
                    icon: Icons.water_drop_outlined,
                    iconColor: Colors.blueGrey,
                  ),
                  customListTile(
                    first: 'فشار هوا (hPa): ',
                    second: '$pressure',
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
  WeatherResponseModel? model;
  WindWidget({this.model});


  @override
  Widget build(BuildContext context) {
    final snapshot = model;
    // var speed = snapshot!.current?.windKph;
    var speed = model!.current!.windSpeed!;

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
              text: 'باد',
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
                    text: 'وزش باد',
                    first: 'سرعت (km/h): ',
                    second: '$speed ',
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
  WeatherResponseModel? model;
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
                      'http://openweathermap.org/img/wn/${model!.current!.weather![0].icon}@2x.png',
                      scale: 2),
                  const SizedBox(height: 5),
                  // appText(
                  //   size: 14,
                  //   text:
                  //       '${snapshot.forecast!.forecastday![0].hour![index].tempC}°',
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
