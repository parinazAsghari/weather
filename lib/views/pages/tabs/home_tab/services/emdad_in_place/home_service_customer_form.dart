import 'package:emdad_khodro_saipa/data_base/hive_db.dart';
import 'package:emdad_khodro_saipa/models/car.dart';
import 'package:emdad_khodro_saipa/views/car_compact_drop_down.dart';
import 'package:emdad_khodro_saipa/views/pages/add_new_car.dart';
import 'package:emdad_khodro_saipa/views/pages/home_page.dart';
import 'package:emdad_khodro_saipa/views/pages/modules/map/map_module.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/emdad_in_place/emdad_in_place_map.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/emdad_in_place/submit_address.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../api_provider/provider.dart';
import '../../../../../../constants.dart';
import '../../../../../widgets/DialogWidgets.dart';
import '../../../../../widgets/LoadingWidgets.dart';
import '../../../../../widgets/custom_submit_button.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../../../../drop_down.dart';
import 'package:emdad_khodro_saipa/globals.dart' as globals;

class HomeServiceCustomerForm extends StatefulWidget {
  HomeServiceCustomerForm({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeServiceCustomerForm> createState() => _HomeServiceCustomerFormState();
}

class _HomeServiceCustomerFormState extends State<HomeServiceCustomerForm> {
  bool _isPhysicalLimit = false;
  bool _isSpeechLimit = false;
  bool _isHearingLimit = false;
  bool _isMovementLimit = false;

  String limit = 'جسمی';

  final TextEditingController _carModelCtrl = TextEditingController();
  final TextEditingController _currentKmCtrl = TextEditingController();

  String? _carProblem;

  String? phone;
  String? fullName;
  String? nationalCode;

  String? _carModelDefaultValue;

  // Map<String, dynamic> carModelListItem = {'': 'مدل خودرو', 'ساینا': 'ساینا','کوییک':'کوییک','پراید':'پراید','تیبا':'تیبا','وانت':'وانت','سراتو':'سراتو','چانگان':'چانگان','شاهین':'شاهین'};
  Map<dynamic, dynamic> carModelListItem = {};
  TextEditingController _userFullNameController = TextEditingController();
  TextEditingController _userNationalCodeController = TextEditingController(text: globals.getProfile.data!.nationalCode);
  final TextEditingController _chassisNoCtrl = TextEditingController();
  final TextEditingController _lastNameCtrl = TextEditingController(text: globals.getProfile.data!.lastName!);
  TextEditingController _coverCarIdCtrl = TextEditingController();



  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getCarsData();
    Future.delayed(Duration.zero).then((value) => getCoverCarId());
  }

  List myCarsList = [];
  Map<String, dynamic> userCarsItem = {};
  getCarsData() async {
    // HiveDB _hiveDB = HiveDB();
    // myCarsList = await _hiveDB.getData('', 'userBox');

    myCarsList = globals.getProfile.data!.carInfos!;


    if (myCarsList.isEmpty) {
      final entry = {'مدل خودرو': 'مدل خودرو'};
      carModelListItem.addEntries(entry.entries);
      setState(() {});
      return;
    }
    myCarsList.forEach((element) {
      final entry = {element: element};
      carModelListItem.addEntries(entry.entries);
    });
    _carModelCtrl.text = '${myCarsList.first.name} - ${myCarsList.first.productionYear}';
    _chassisNoCtrl.text = '${myCarsList.first.chassisNo}';

    setState(() {});
    return;
  }

  void getCoverCarId(){
    // _coverCarIdCtrl.text = globals.getProfile.data!.coverCars!.where((element) => element.name == _carModelCtrl.text).first.id.toString();



    // _coverCarIdCtrl.text = globals.getProfile.data!.coverCars!.firstWhere((element) => element.name == _carModelCtrl.text).name!;
    // print(_coverCarIdCtrl.text);

    globals.getProfile.data!.coverCars!.forEach((element) {
      if(element.name == _carModelCtrl.text){
        _coverCarIdCtrl.text = element.id.toString();
        print(_coverCarIdCtrl.text);

        return;
      }
      return;

    });
    // if(_coverCarIdCtrl.text.isEmpty){
    //   showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return MessageDialogWidget(
    //           dismissable: true,
    //           title: 'ورود اطلاعات',
    //           body: 'امکان ثبت درخواست برای خودروی انتخاب شده وجود ندارد',
    //           positiveTxt: 'باشه',
    //         );
    //       });
    //
    //   return;
    // }


    // if(_coverCarIdCtrl.text.isEmpty){
    //   showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return MessageDialogWidget(
    //           dismissable: true,
    //           title: 'ورود اطلاعات',
    //           body: 'امکان ثبت درخواست برای خودروی انتخاب شده وجود ندارد',
    //           positiveTxt: 'باشه',
    //         );
    //       });
    //
    //   return;
    // }
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
      // key: _formKey,
      child: SizedBox(
        // height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 19,
                ),
                Container(
                    // padding: EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    child: Text(
                      'مشخصات خودرو',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                SizedBox(
                  height: 8,
                ),
                // _customTextField(
                //   title: 'مدل خودرو *',
                //   controller: _carModelCtrl,
                // ),
                Padding(
                  padding:  EdgeInsets.only(top: 8.0, bottom: 4, left: 24, right: 24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('انتخاب خودرو *', textAlign: TextAlign.right,),
                          TextButton(
                              onPressed: (){
                                // Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddNewCar(isCarFromDataBase: false)));



                              },
                              child: Text('افزودن خودروی جدید +', style: TextStyle(fontSize: 14,color: Theme.of(context).primaryColor),)),

                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: CarCompactDropDown(
                          readOnlyDropDown: false,
                          primaryBackgroundColor: Colors.transparent,
                          iconColor: Colors.pink,
                          dropdownMenuItemStyle: const TextStyle(color: Colors.black),
                          defaultValue: _carModelDefaultValue,
                          // firstItemSelectMessage: 'انتخاب',
                          alignmentCenterLeft: false,
                          enabledBorderColor: Colors.black,
                          items: carModelListItem,
                          validations: const [],
                          onChange: (value) {
                            _carModelCtrl.text = value;
                            _chassisNoCtrl.text = myCarsList.firstWhere((element) => element.name == value).chassisNo!;
                            getCoverCarId();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                CustomTextField(
                  title: 'نام خانوادگی *',
                  height: 35,
                  marginTop: 11,
                  controller: _lastNameCtrl,
                ),
                SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  title: 'کد ملی *',
                  height: 35,
                  marginTop: 11,
                  controller: _userNationalCodeController,
                ),
                SizedBox(
                  height: 8,
                ),

                CustomTextField(
                  title: ' شماره شاسی خودرو *',
                  height: 35,
                  marginTop: 11,
                  controller: _chassisNoCtrl,
                ),
                // _customTextField(
                //     title: 'شماره شاسی *', controller: _chassingNumberCtrl),
                SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  title: 'کیلومتر فعلی خودرو *',
                  height: 35,
                  marginTop: 11,
                  controller: _currentKmCtrl,
                ),

                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 11 / 520,
                // ),
                _customCheckBox(
                  text: 'دارای محدودیت $limit می‌باشم',
                  value: _isPhysicalLimit,
                  onTap: (value) {
                    print('limit $value');
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return MessageDialogWidget(
                            dismissable: true,
                            hasTextBody: false,
                            widget: _customDialogBody(),
                            positiveTxt: 'ثبت',
                            positiveFunc: () {
                              _isPhysicalLimit = true;
                              setState(
                                () {
                                  limit = _limitStatus(
                                    isPhysical: _isPhysicalLimit,
                                    isSpeech: _isSpeechLimit,
                                    isHearing: _isHearingLimit,
                                    isMovement: _isMovementLimit,
                                  );
                                },
                              );
                            },
                          );
                        });
                  },
                ),
              ],
            ),
            //Todo if not responsive change size of textbox
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.5 / 15,
            // ),
            SizedBox(
              height: 8,
            ),
            CustomSubmitButton(onTap: _onSubmitTap, text: 'تائید و ادامه'),
          ],
        ),
      ),
    );
  }

  String _limitStatus({
    bool isPhysical = false,
    bool isSpeech = false,
    bool isHearing = false,
    bool isMovement = false,
  }) {
    if (isSpeech) {
      if (isHearing) {
        if (isMovement) {
          return 'گفتاری و شنیداری و حرکتی';
        }
        return 'گفتاری و شنیداری';
      }
      if (isMovement) {
        return 'گفتاری و حرکتی';
      }
      return 'گفتاری';
    }
    if (isHearing) {
      if (isMovement) {
        return 'شنیداری و حرکتی';
      }
      return 'شنیداری';
    }
    if (isMovement) {
      return 'حرکتی';
    }
    _isPhysicalLimit = false;
    return 'جسمی';
  }

  Widget _customDialogBody() {
    return StatefulBuilder(builder: (context, setS) {
      return Column(
        children: [
          _customCheckBox(
            text: 'گفتاری',
            value: _isSpeechLimit,
            onTap: (value) {
              print('speech $value');
              _isSpeechLimit = value;
              setS(() {});
            },
          ),
          _customCheckBox(
            text: 'شنوایی',
            value: _isHearingLimit,
            onTap: (value) {
              print('hear $value');
              setS(() {
                _isHearingLimit = value;
              });
            },
          ),
          _customCheckBox(
            text: 'حرکتی',
            value: _isMovementLimit,
            onTap: (value) {
              print('movement $value');

              _isMovementLimit = value;
              setS(() {});
            },
          ),
        ],
      );
    });
  }

  Widget _customCheckBox({
    @required String? text,
    @required bool? value,
    @required onTap,
  }) {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: 24,
        ),
        Checkbox(
            value: value,
            onChanged: (val) {
              onTap(val);
            }),
        const SizedBox(width: 10),
        Text(
          text ?? '',
          style: const TextStyle(fontSize: 12.0),
        ),
      ],
    );
  }

  _onSubmitTap() async {
    print(_coverCarIdCtrl.text);

    if (_carModelCtrl.text.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              dismissable: true,
              title: 'ورود اطلاعات',
              body: 'لطفا مدل خودرو خود را وارد نمائید',
              positiveTxt: 'باشه',
            );
          });

      return;
    }
    if(_coverCarIdCtrl.text.isEmpty){
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              dismissable: true,
              title: 'ورود اطلاعات',
              body: 'امکان ثبت درخواست برای خودروی انتخاب شده وجود ندارد.',
              positiveTxt: 'باشه',
            );
          });

      return;
    }
    if (_lastNameCtrl.text.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              dismissable: true,
              title: 'ورود اطلاعات',
              body: 'لطفا نام خانوادگی خود را وارد نمائید',
              positiveTxt: 'باشه',
            );
          });

      return;
    }
    if (_userNationalCodeController.text.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              dismissable: true,
              title: 'ورود اطلاعات',
              body: 'لطفا کد ملی خود را وارد نمائید',
              positiveTxt: 'باشه',
            );
          });

      return;
    }

    if (_chassisNoCtrl.text.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              dismissable: true,
              title: 'ورود اطلاعات',
              body: 'لطفا شماره شاسی خودرو خود را وارد نمائید',
              positiveTxt: 'باشه',
            );
          });

      return;
    }

    if (_currentKmCtrl.text.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              dismissable: true,
              title: 'ورود اطلاعات',
              body: 'لطفا کیلومتر فعلی خودرو خود را وارد نمائید',
              positiveTxt: 'باشه',
            );
          });

      return;
    }

    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return CircleLoadingWidget(
    //         dismissable: false,
    //         msgTxt: 'لطفا منتظر بمانید',
    //       );
    //     });

    //store data
    globals.submitHomeServiceRequest.nationalCode = _userNationalCodeController.text;
    globals.submitHomeServiceRequest.mobileNumber = globals.getProfile.data!.mobileNumber!;
    globals.submitHomeServiceRequest.lastName = _lastNameCtrl.text;
    globals.submitHomeServiceRequest.chassisNo = _chassisNoCtrl.text;
    globals.submitHomeServiceRequest.distanceTraveledKm = int.parse(_currentKmCtrl.text);
    globals.submitHomeServiceRequest.coverCarId = int.parse(_coverCarIdCtrl.text);


    // Navigator.of(context).pop();
    LatLng latLng = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MapModule()));

    globals.submitHomeServiceRequest.latitude = latLng.latitude;
    globals.submitHomeServiceRequest.longitude = latLng.longitude;

     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SubmitAddress(latLng: latLng,)));




    //clear textFields
    // _idCtrl.clear();
    // _nameCtrl.clear();

    // await Future.delayed(const Duration(milliseconds: 4000));
    //
    // Navigator.of(context).pop();

    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return MessageDialogWidget(
    //         dismissable: false,
    //         hasTextBody: false,
    //         widget: Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Column(
    //             children: [
    //               Text('مشتری گرامی اطلاعات شما با شماره پیگیری 98995 در سامانه ثبت گردید.',textAlign: TextAlign.center),
    //               Text('همکاران ما بزودی با شما تماس خواهند گرفت.',textAlign: TextAlign.center),
    //               Text('شماره همراه ثبت شده: $phone',textAlign: TextAlign.center,),
    //             ],
    //           ),
    //         ),
    //         positiveTxt: 'تایید',
    //         positiveFunc: () async {
    //
    //           //save to user data
    //           SharedPreferences preferences = await SharedPreferences.getInstance();
    //           preferences.setString('user_full_name', _carModelCtrl.text);
    //           preferences.setString('user_national_code', _chassingNumberCtrl.text);
    //
    //
    //           Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    //         },
    //       );
    //     });
  }
}
