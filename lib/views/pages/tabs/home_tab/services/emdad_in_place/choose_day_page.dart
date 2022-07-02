import 'package:emdad_khodro_saipa/api_provider/provider.dart';
import 'package:emdad_khodro_saipa/models/response_model/get_time_table.dart';
import 'package:emdad_khodro_saipa/views/pages/home_page.dart';
import 'package:emdad_khodro_saipa/views/widgets/LoadingWidgets.dart';
import 'package:emdad_khodro_saipa/views/widgets/custom_neomorphic_box.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../../../../../../constants.dart';
import '../../../../../widgets/DialogWidgets.dart';
import '../../../../../widgets/custom_submit_button.dart';
import 'choose_time_page.dart';
import 'package:emdad_khodro_saipa/globals.dart' as globals;

class ChooseDayPage extends StatefulWidget {
  const ChooseDayPage({Key? key}) : super(key: key);

  @override
  State<ChooseDayPage> createState() => _ChooseDayPageState();
}

class _ChooseDayPageState extends State<ChooseDayPage> {
  int? selectedIndex;



  // List<DayTime> dayList = [
  //   DayTime(title: 'شنبه: 15 خرداد 1401', isFull: false),
  //   DayTime(title: 'یکشنبه: 16 خرداد 1401', isFull: false),
  //   DayTime(title: 'دوشنبه: 17 خرداد 1401', isFull: false),
  //   DayTime(title: 'سه شنبه: 18 خرداد 1401', isFull: true),
  //   DayTime(title: 'چهار شنبه: 19 خرداد 1401', isFull: true),
  //   DayTime(title: 'پنج شنبه: 20 خرداد 1401', isFull: false),
  //   DayTime(title: 'جمعه: 21 خرداد 1401', isFull: false),
  // ];
  List<DayTime> dayList = [];

  List<String> uniqueDate = [];
  List<String> uniqueTime = [];



  @override
  void initState() {
    super.initState();
    getTimeTable();
  }


   bool loading = true;
  getTimeTable()async{
    GetTimeTable result = await ApiProvider.getTimeTable();

    if(result.resultCode == 0){
      result.data!.items!.forEach((element) {
        if(!uniqueDate.contains(element.persianDate)){
          uniqueDate.add(element.persianDate!);
        }
        // if(!uniqueTime.contains(element.time!)){
        //   uniqueTime.add(element.time!);
        //
        // }

      });






      result.data!.items!.forEach((element) {
        dayList.add(DayTime(
            jalajiDate: element.persianDate!,
            time: element.time!,
            title: "${element.persianDateText}  ${element.time}",
            isFull: false
        )
        );
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
              body: 'خطا در ارتباط با سرور، لطفا دوباره سعی کنید',
              dismissable: true,
              positiveTxt: 'باشه',
              positiveFunc: () async {},
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16, bottom: 8),
            alignment: Alignment.center,
            child: const Text(
              'انتخاب تاریخ و زمان ارائه خدمت',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),

          if(loading)Center(child: CircularProgressIndicator(),),


          ListView.builder(
            shrinkWrap: true,
            itemCount: uniqueDate.length +1,
            itemBuilder: (BuildContext context, int index){

                if(index == uniqueDate.length){
                  return CustomSubmitButton(text: 'ثبت نهایی', onTap: _onSubmitTap);
                }else{
                  return ExpandableNotifier(
                      child: Expandable(
                        collapsed: Builder(
                          builder: (context) {
                            var controller = ExpandableController.of(context);

                            return InkWell(
                              onTap: (){
                                controller?.toggle();

                              },
                              child: CustomNeomorphicBox(
                                title: uniqueDate[index],
                                isFull: false,
                                index: index,
                                selectedIndex: selectedIndex,
                                height: 40 / 640,
                                onTap: () {
                                  // if (!dayList[index].isFull) {
                                  //   setState(() {
                                  //     selectedIndex = index;
                                  //   });
                                  // }
                                },
                              ),
                            );
                          },
                        ),
                        expanded: Container(
                          decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.zero,
                                child: Builder(
                                  builder: (context) {
                                    var controller = ExpandableController.of(context);

                                    List<Widget> finalTimeList = [];
                                    dayList.forEach((element) {
                                      if(element.title == uniqueDate[index]){
                                        finalTimeList.add(Text(element.time));
                                      }
                                    });


                                    return Padding(
                                      padding: EdgeInsets.zero,
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              controller?.toggle();

                                            },
                                            child: CustomNeomorphicBox(
                                              title: uniqueDate[index],
                                              isFull: false,
                                              index: index,
                                              selectedIndex: selectedIndex,
                                              height: 40 / 640,
                                              onTap: () {
                                                if (!dayList[index].isFull) {
                                                  setState(() {
                                                    selectedIndex = index;
                                                  });
                                                }
                                              },
                                            ),
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                                              // color: Theme.of(context).cardColor,
                                            ),
                                            child: SizedBox(
                                              child: ListView(shrinkWrap: true, children: finalTimeList),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  );
                }


              },

          ),




          //old UI
          /*
          Expanded(
            child: ListView.builder(
              itemCount: dayList.length + 1,
              itemBuilder: (ctx, i) {
                if (i == dayList.length) {
                  return CustomSubmitButton(text: 'ثبت نهایی', onTap: _onSubmitTap);
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

           */
        ],
      ),
    );
  }

  _onSubmitTap() async {
    if (selectedIndex == null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              dismissable: true,
              title: 'ورود اطلاعات',
              body: 'لطفا روز مورد نظر خود را انتخاب نمائید',
              positiveTxt: 'باشه',
            );
          });

      return;
    }

    globals.submitHomeServiceRequest.time = dayList[selectedIndex!].time;
    globals.submitHomeServiceRequest.dateJalali = dayList[selectedIndex!].jalajiDate;

    //TODO call submit request
    //TODO show dialog

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CircleLoadingWidget(
            dismissable: false,
            msgTxt: 'لطفا منتظر بمانید',
          );
        });



    await Future.delayed(Duration(seconds: 3));

    Navigator.pop(context);

    showDialog(context: context, builder: (BuildContext context){

      return MessageDialogWidget(
        dismissable: true,
        title: 'درخواست ثبت شد',
        body:  'درخواست شما با موفقیت ثبت شد. همکاران ما بزودی با شما تماس خواهند گرفت',
        positiveTxt: 'باشه',
        positiveFunc: (){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              HomePage()), (Route<dynamic> route) => false);
        },
      );
    });




    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => const ChooseTimePage(),
    //   ),
    // );
  }
}

class DayTime {
  @required
  String? title;
  @required
  bool isFull;
  @required
  String jalajiDate;
  @required
  String time;

  DayTime({this.title, required this.isFull, required this.time, required this.jalajiDate});
}
