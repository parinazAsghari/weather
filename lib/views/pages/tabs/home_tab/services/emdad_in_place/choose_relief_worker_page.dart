import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/emdad_in_place/choose_day_page.dart';
import 'package:emdad_khodro_saipa/views/widgets/custom_neomorphic_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../constants.dart';
import '../../../../../widgets/DialogWidgets.dart';
import '../../../../../widgets/custom_submit_button.dart';

class ChooseReliefWorkerPage extends StatefulWidget {
  const ChooseReliefWorkerPage({Key? key}) : super(key: key);

  @override
  State<ChooseReliefWorkerPage> createState() => _ChooseReliefWorkerPageState();
}

class _ChooseReliefWorkerPageState extends State<ChooseReliefWorkerPage> {
  int? selectedIndex;

  List<ReliefWorker> reliefWorkerList = [
    ReliefWorker(name: 'امداد تست', score: 4.67),
    ReliefWorker(name: 'امداد تست 1', score: 3.78),
    ReliefWorker(name: 'امداد تست 2', score: 2.75),
  ];

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


        Expanded(
          child: ListView.builder(
            itemCount: reliefWorkerList.length+1,
            itemBuilder: (ctx, i) {
              if (i == reliefWorkerList.length ) {
                return CustomSubmitButton(
                    onTap: _onSubmitTap,
                    text: 'تایید');
              } else {
                return CustomNeomorphicBox(title: '', index: i, selectedIndex: selectedIndex, isFull: false,height: 75/640,isChildText: false,widget: _subItemsServis(title: reliefWorkerList[i].name, imagePath: 'assets/images/relief_worker.png', score: reliefWorkerList[i].score), onTap: (){
                  setState(() {
                    selectedIndex = i;
                  });
                }, );
              }
            },
          ),
        ),


      ],
    );
  }

  _onSubmitTap(){
    if (selectedIndex == null) {
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
        builder: (BuildContext context) => const ChooseDayPage(),
      ),
    );
  }

  Widget _subItemsServis({required String title, required String imagePath, required double score}){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 12,
        ),
        Container(
          alignment: Alignment.center,
          // height: 60,
          // width: 60,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            // height: 4,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
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
                  style: const TextStyle(
                      fontFamily: 'Vazir',
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
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
          color: selectedIndex == 3
              ? dark_theme_white_low
              : Theme.of(context).cardColor,
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
  @required
  double score;
  @required
  String name;

  ReliefWorker({required this.score, required this.name});
}
