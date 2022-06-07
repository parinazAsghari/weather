import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/emdad_in_place/widget/custom_service_box.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/emdad_in_place/widget/custom_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../constants.dart';
import '../../../../../widgets/DialogWidgets.dart';
import '../../../../home_page.dart';

class ChooseTimePage extends StatefulWidget {
  const ChooseTimePage({Key? key}) : super(key: key);

  @override
  State<ChooseTimePage> createState() => _ChooseTimePageState();
}

class _ChooseTimePageState extends State<ChooseTimePage> {
  int? selectedIndex;

  List<DayTime> dayList = [
    DayTime(title: '08:30', isFull: false),
    DayTime(title: '10:00', isFull: false),
    DayTime(title: '11:30', isFull: false),
    DayTime(title: '13:00', isFull: false),
    DayTime(title: '14:30', isFull: true),
    DayTime(title: '16:00', isFull: true),
    DayTime(title: '17:30', isFull: false),
  ];

  String? phone;

  void getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    phone = preferences.getString('user_phone_number');
  }

  @override
  void initState() {
    super.initState();
    getUserData();
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
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          alignment: Alignment.center,
          child: const Text(
            'انتخاب ساعت',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: dayList.length + 1,
            itemBuilder: (ctx, i) {
              if (i == dayList.length) {
                return CustomSubmitButton(
                    onTap: () async {
                      if (selectedIndex == null) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return MessageDialogWidget(
                                dismissable: true,
                                title: 'ورود اطلاعات',
                                body: 'لطفا ساعت مورد نظر خود را وارد نمائید',
                                positiveTxt: 'باشه',
                              );
                            });

                        return;
                      }

                      // await Future.delayed(const Duration(milliseconds: 4000));

                      // Navigator.of(context).pop();

                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return MessageDialogWidget(
                              dismissable: false,
                              hasTextBody: false,
                              widget: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  children: [
                                    const Text(
                                        'مشتری گرامی اطلاعات شما با شماره پیگیری 98995 در سامانه ثبت گردید.',
                                        textAlign: TextAlign.center),
                                    const Text(
                                        'همکاران ما بزودی با شما تماس خواهند گرفت.',
                                        textAlign: TextAlign.center),
                                    Text(
                                      'شماره همراه ثبت شده: $phone',
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              positiveTxt: 'تایید',
                              positiveFunc: () async {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const HomePage()));
                              },
                            );
                          });
                    },
                    text: 'تایید');
              } else {
                return CustomServiceBox(
                  title: dayList[i].title,
                  index: i,
                  selectedIndex: selectedIndex,
                  height: 40/640,
                  isFull: dayList[i].isFull,
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
}

class DayTime {
  @required
  String? title;
  @required
  bool isFull;

  DayTime({this.title, required this.isFull});
}
