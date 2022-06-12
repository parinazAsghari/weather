import 'package:emdad_khodro_saipa/api_provider/provider.dart';
import 'package:emdad_khodro_saipa/models/GeoLocation.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/emdad_in_place/choose_time_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../../constants.dart';
import '../../../../../widgets/DialogWidgets.dart';

class ChooseDayPage extends StatefulWidget {
  const ChooseDayPage({Key? key, this.latLng}) : super(key: key);
  final LatLng? latLng;

  @override
  State<ChooseDayPage> createState() => _ChooseDayPageState();
}

class _ChooseDayPageState extends State<ChooseDayPage> {
  int? selectedIndex;

  List<DayTime> dayList = [
    DayTime(title: 'شنبه: 15 خرداد 1401', isFull: false),
    DayTime(title: 'یکشنبه: 16 خرداد 1401', isFull: false),
    DayTime(title: 'دوشنبه: 17 خرداد 1401', isFull: false),
    DayTime(title: 'سه شنبه: 18 خرداد 1401', isFull: true),
    DayTime(title: 'چهار شنبه: 19 خرداد 1401', isFull: true),
    DayTime(title: 'پنج شنبه: 20 خرداد 1401', isFull: false),
    DayTime(title: 'جمعه: 21 خرداد 1401', isFull: false),
  ];

  // var response;
  //
  // getDates()async{
  //   GeoLocation geoLocation = GeoLocation(lat: widget.latLng!.latitude,long: widget.latLng!.longitude);
  //   response =await ApiProvider.getReservableDates(["48ff9bd2-289b-47e5-8925-b770e245d2f0"],"c9fd138e-81cf-4bf0-90fa-d13870c9781f",geoLocation );
  //   response.data.dates.forEach((element) {
  //     dayList.add(DayTime(title:element.jalaliDate , isFull: false));
  //   });
  //   setState(() {
  //
  //   });
  // }
  @override
  void initState() {
    // getDates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          'assets/images/emdad_khodro_logo_white_text.png',
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
          child: Text('انتخاب روز',
            style:TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: dayList.length+1,
            itemBuilder: (ctx, i) {
              if (i == dayList.length ) {
                return _submitButton();
              } else {
                return _serviceBox(dayList[i].title, dayList[i].isFull, i);
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _serviceBox(_title, isFull, index) {
    // print(index + ' ' + isFull.toString());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      height: MediaQuery.of(context).size.height * 40 / 640,
      child: NeumorphicButton(
        onPressed: () {
          if (!isFull) {
            setState(() {
              selectedIndex = index;
            });
          }
        },
        padding: EdgeInsets.only(right: 0, left: 0),
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          // depth: 1.5,
          depth: 8,
          lightSource: LightSource.topLeft,
          color: selectedIndex == index
              ? dark_theme_white_low
              : Theme.of(context).cardColor,
          shadowDarkColor: Theme.of(context).shadowColor,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            _title,
            style: TextStyle(
                fontFamily: 'Vazir',
                fontWeight: FontWeight.bold,
                color: isFull ? Theme.of(context).shadowColor : Colors.black,
                fontSize: 14),
          ),
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
                  body: 'لطفا روز مورد نظر خود را وارد نمائید',
                  positiveTxt: 'باشه',
                );
              });

          return;
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                ChooseTimePage(),),);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).accentColor,
            // color: color_sharp_orange,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          // color: color_sharp_orange,
          color: Theme.of(context).accentColor,
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 33 / 520,
        margin: const EdgeInsets.only(right: 24, left: 24, top: 8, bottom: 8),
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

class DayTime {
  @required
  String? title;
  @required
  bool? isFull;

  DayTime({this.title, this.isFull});
}
