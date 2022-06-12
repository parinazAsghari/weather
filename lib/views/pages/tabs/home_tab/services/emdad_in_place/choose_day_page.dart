import 'package:emdad_khodro_saipa/views/widgets/custom_neomorphic_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../../../../../../constants.dart';
import '../../../../../widgets/DialogWidgets.dart';
import '../../../../../widgets/custom_submit_button.dart';
import 'choose_time_page.dart';

class ChooseDayPage extends StatefulWidget {
  const ChooseDayPage({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          'assets/images/emdad_khodro_logo_white_text.png',
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
            'انتخاب روز',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: dayList.length + 1,
            itemBuilder: (ctx, i) {
              if (i == dayList.length) {
                return CustomSubmitButton(text: 'تایید', onTap: _onSubmitTap);
              } else {
                return CustomNeomorphicBox(
                  title: dayList[i].title,
                  isFull: dayList[i].isFull,
                  index: i,
                  selectedIndex: selectedIndex,
                  height: 40 / 640,
                  onTap: () {
                    if (!dayList[i].isFull) {
                      setState(() {
                        selectedIndex = i;
                      });
                    }
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
              body: 'لطفا روز مورد نظر خود را وارد نمائید',
              positiveTxt: 'باشه',
            );
          });

      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const ChooseTimePage(),
      ),
    );
  }
}

class DayTime {
  @required
  String? title;
  @required
  bool isFull;

  DayTime({this.title, required this.isFull});
}
