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


  void getUserData()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    phone = preferences.getString('user_phone_number');






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
          child: Text('انتخاب ساعت'),
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
          depth: 1.5,
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
                color: isFull ? dak_theme_box_shadow_dark : Colors.black,
                fontSize: 14),
          ),
        ),
      ),
    );
  }

  Widget _submitButton() {

    return GestureDetector(
      onTap: () async {
        if(selectedIndex==null){
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

        await Future.delayed(const Duration(milliseconds: 4000));

        Navigator.of(context).pop();

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return MessageDialogWidget(
                dismissable: false,
                hasTextBody: false,
                widget: Padding(
                  padding:  EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Text('مشتری گرامی اطلاعات شما با شماره پیگیری 98995 در سامانه ثبت گردید.',textAlign: TextAlign.center),
                      Text('همکاران ما بزودی با شما تماس خواهند گرفت.',textAlign: TextAlign.center),
                      Text('شماره همراه ثبت شده: $phone',textAlign: TextAlign.center,),
                    ],
                  ),
                ),
                positiveTxt: 'تایید',
                positiveFunc: () async {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                },
              );
            });
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: color_sharp_orange, width: 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            color: color_sharp_orange),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 33 / 520,
        margin: const EdgeInsets.only(right: 24, left: 24, top: 8,bottom: 8),
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
