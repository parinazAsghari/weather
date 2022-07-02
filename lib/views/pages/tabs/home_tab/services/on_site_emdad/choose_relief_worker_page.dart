import 'package:emdad_khodro_saipa/api_provider/provider.dart';
import 'package:emdad_khodro_saipa/models/GeoLocation.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/on_site_emdad/choose_day_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../constants.dart';
import '../../../../../widgets/DialogWidgets.dart';

class ChooseReliefWorkerPage extends StatefulWidget {
  const ChooseReliefWorkerPage({Key? key, this.latLng}) : super(key: key);
  final LatLng? latLng;

  @override
  State<ChooseReliefWorkerPage> createState() => _ChooseReliefWorkerPageState();
}

class _ChooseReliefWorkerPageState extends State<ChooseReliefWorkerPage> {
  int? selectedIndex;

  List<ReliefWorker> reliefWorkerList = [
    // ReliefWorker(name: 'امداد تست',score: 4.67),
    // ReliefWorker(name: 'امداد تست 1',score: 3.78),
    // ReliefWorker(name: 'امداد تست 2',score: 2.75),
  ];

  var response;

  getPackages() async {
    // GeoLocation geoLocation = GeoLocation(lat: widget.latLng!.latitude, long: widget.latLng!.longitude);
    // response = await ApiProvider.getEmdadGarList('48ff9bd2-289b-47e5-8925-b770e245d2f0', geoLocation);
    // response.data.emdadgarList.forEach((element) {
    //   reliefWorkerList.add(ReliefWorker(name: element.fullName, score: element.score));
    // });
    // setState(() {});
  }

  @override
  void initState() {
    getPackages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          'assets/images/emdad_khodro_logo.png',
          height: 30,
          width: MediaQuery.of(context).size.width * 0.35,
          fit: BoxFit.contain,
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 16, bottom: 8),
          alignment: Alignment.center,
          child: Text(
            'انتخاب خدمات رسان',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        response == null
            ? const Center(child: CircularProgressIndicator())
            : Expanded(
                child: ListView.builder(
                  itemCount: reliefWorkerList.length,
                  itemBuilder: (context, position) {
                    return _serviceBox(reliefWorkerList[position].name, 'assets/images/relief_worker.png', reliefWorkerList[position].score, position);
                  },
                ),
              ),

        // _serviceNotImportant(),

        _submitButton()

        /*
        Expanded(
          child: ListView.builder(
            itemCount: reliefWorkerList.length+1,
            itemBuilder: (ctx, i) {
              if (i == reliefWorkerList.length ) {
                return _submitButton();
              } else {
                return _serviceBox(reliefWorkerList[i].name, 'assets/images/relief_worker.png', reliefWorkerList[i].score,i);
              }
            },
          ),
        ),

         */
      ],
    );
  }

  Widget _serviceBox(_title, _imagePath, score,index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      height: MediaQuery.of(context).size.height * 75 / 640,
      child: NeumorphicButton(
        onPressed: () {
          setState(() {
            selectedIndex = index;
          });
        },
        padding: EdgeInsets.only(right: 0, left: 0),
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          // depth: 1.5,
          depth: 8,
          lightSource: LightSource.topLeft,
          color: selectedIndex==index?dark_theme_white_low:Theme.of(context).cardColor,
          shadowDarkColor: Theme.of(context).shadowColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 12,),
            Container(
              alignment: Alignment.center,
              // height: 60,
              // width: 60,
              child: Image.asset(
                _imagePath,
                fit: BoxFit.cover,
                // height: 4,
              ),
            ),
            SizedBox(width: 8,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _title,
                  style: TextStyle(
                      fontFamily: 'Vazir',
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'امتیاز: $score',
                      style: TextStyle(
                          fontFamily: 'Vazir',
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    RatingBarIndicator(
                      rating: score,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget _serviceNotImportant(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      height: MediaQuery.of(context).size.height * 75 / 640,
      child: NeumorphicButton(
        onPressed: () {
          setState(() {
            selectedIndex = 3;
          });
        },
        padding: EdgeInsets.only(right: 0, left: 0),
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          // depth: 1.5,
          depth: 8,
          lightSource: LightSource.topLeft,
          color: selectedIndex==3?dark_theme_white_low:Theme.of(context).cardColor,
          shadowDarkColor: Theme.of(context).shadowColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('انتخاب خدمت رسان برای من مهم نیست')

          ],
        ),
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: (){
        if(selectedIndex==null){
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return MessageDialogWidget(
                  dismissable: true,
                  title: 'ورود اطلاعات',
                  body: 'لطفا خدمت رسان مورد نظر خود را وارد نمائید',
                  positiveTxt: 'باشه',
                );
              });

          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                ChooseDayPage(),),);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).accentColor,
                // color: color_sharp_orange,
                width: 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            // color: color_sharp_orange
            color: Theme.of(context).accentColor),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 33 / 520,
        margin: const EdgeInsets.only(right: 24, left: 24, bottom: 8, top: 8),
        child: const Text(
          'تایید',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

}

class ReliefWorker{
  @required double? score;
  @required String? name;

  ReliefWorker({this.score,this.name});
}
