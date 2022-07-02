import 'dart:convert';

import 'package:emdad_khodro_saipa/api_provider/provider.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/emdad_in_place/choose_day_page.dart';
import 'package:emdad_khodro_saipa/views/widgets/custom_neomorphic_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../constants.dart';
import '../../../../../widgets/DialogWidgets.dart';
import '../../../../../widgets/custom_submit_button.dart';
import 'package:emdad_khodro_saipa/globals.dart' as globals;

class ChooseReliefWorkerPage extends StatefulWidget {
  const ChooseReliefWorkerPage({Key? key}) : super(key: key);

  @override
  State<ChooseReliefWorkerPage> createState() => _ChooseReliefWorkerPageState();
}

class _ChooseReliefWorkerPageState extends State<ChooseReliefWorkerPage> {
  int? selectedIndex;
  int? selectedWorker;

  List<ReliefWorker> reliefWorkerList = [
    // ReliefWorker(fullName: 'امداد تست', score: 4.67),
    // ReliefWorker(fullName: 'امداد تست 1', score: 3.78),
    // ReliefWorker(fullName: 'امداد تست 2', score: 2.75),
  ];

  @override
  void initState() {
    super.initState();
    getEmdadgarList();

  }
  bool loading = true;

  getEmdadgarList() async {
    var result = await ApiProvider.getEmdadgarList(LatLng(globals.submitHomeServiceRequest.latitude!, globals.submitHomeServiceRequest.longitude!));

    if(result.resultCode ==0){
      reliefWorkerList.clear();
      result.data!.emdadgarList!.forEach((element) {
        reliefWorkerList.add(ReliefWorker(
          firstName: element.firstName,
          lastName: element.lastName,
          fullName: element.fullName,
          id: element.id,
          score: element.score,
          image: element.imageBase64
        ));
      });
      setState(() {

        loading = false;
      });
    }
    else{
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              dismissable: true,
              title: 'ورود اطلاعات',
              body: 'خطا در ارتباط با سرور، لطفا دوباره سعی کنید',
              positiveTxt: 'باشه',
            );
          });

      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          'assets/images/emdad_khodro_logo.png',
          // height: 30,
          width: MediaQuery.of(context).size.width * 0.45,
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
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          alignment: Alignment.center,
          child: const Text(
            'انتخاب خدمات رسان',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),

        // _serviceBox(reliefWorkerList[0].name, 'assets/images/relief_worker.png',
        //     reliefWorkerList[0].score, 0),
        // _serviceBox(reliefWorkerList[1].name, 'assets/images/relief_worker.png',
        //     reliefWorkerList[1].score, 1),
        // _serviceBox(reliefWorkerList[2].name, 'assets/images/relief_worker.png',
        //     reliefWorkerList[2].score, 2),

        // _serviceNotImportant(),

        if(loading)Center(child: CircularProgressIndicator(),),
        Expanded(
          child: ListView.builder(
            itemCount: reliefWorkerList.length + 1,
            itemBuilder: (ctx, i) {
              if (i == reliefWorkerList.length) {
                return CustomSubmitButton(onTap: _onSubmitTap, text: 'تائید و ادامه');
              } else {
                return CustomNeomorphicBox(
                  title: '',
                  index: i,
                  selectedIndex: selectedIndex,
                  isFull: false,
                  height: 75 / 640,
                  isChildText: false,
                  widget: _subItemsServis(title: reliefWorkerList[i].fullName!,
                      imagePath: reliefWorkerList[i].image!,
                      score: reliefWorkerList[i].score!),
                  onTap: () {
                    setState(() {
                      selectedIndex = i;
                      selectedWorker = reliefWorkerList[i].id;
                    });
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }

  _onSubmitTap() {
    if (selectedIndex == null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              dismissable: true,
              title: 'ورود اطلاعات',
              body: 'لطفا خدمت رسان مورد نظر خود را انتخاب نمائید',
              positiveTxt: 'باشه',
            );
          });
      return;
    }
    globals.submitHomeServiceRequest.emdadgarId = selectedWorker;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const ChooseDayPage(),
      ),
    );
  }

  Widget _subItemsServis({required String title, required String imagePath, required double score}) {

    
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 12,
        ),
        // Container(
        //   alignment: Alignment.center,
        //   // height: 60,
        //   // width: 60,
        //   child: Image.asset(
        //     imagePath,
        //     fit: BoxFit.cover,
        //     // height: 4,
        //   ),
        // ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontFamily: 'Vazir', fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'امتیاز: $score',
                  style: const TextStyle(fontFamily: 'Vazir', fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(
                  width: 50,
                ),
                RatingBarIndicator(
                  rating: score,
                  itemBuilder: (context, index) => const Icon(
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

        Expanded(child: Container()),

        Container(
          padding: EdgeInsets.only(left: 16),
          alignment: Alignment.center,
          height: 70,
          width: 70,

          child: Image.memory(base64Decode(imagePath))
          ,
          /*
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            // height: 4,
          ),

           */
        ),
      ],
    );
  }

  Widget _serviceNotImportant() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      height: MediaQuery.of(context).size.height * 75 / 640,
      child: NeumorphicButton(
        onPressed: () {
          setState(() {
            selectedIndex = 3;
          });
        },
        padding: const EdgeInsets.only(right: 0, left: 0),
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          depth: 1.5,
          lightSource: LightSource.topLeft,
          color: selectedIndex == 3 ? dark_theme_white_low : Theme.of(context).cardColor,
          shadowDarkColor: Theme.of(context).shadowColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Text('انتخاب خدمت رسان برای من مهم نیست')],
        ),
      ),
    );
  }
}

class ReliefWorker {

  double? score;
  String? lastName;
  int? id;
  String? firstName;
  String? fullName;
  String? image;

  ReliefWorker({ this.score,  this.lastName, this.firstName, this.fullName, this.id, this.image});
}
