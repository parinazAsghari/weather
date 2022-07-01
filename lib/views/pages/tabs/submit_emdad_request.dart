import 'package:emdad_khodro_saipa/data_base/hive_db.dart';
import 'package:emdad_khodro_saipa/models/GeoLocation.dart';
import 'package:emdad_khodro_saipa/models/car_info.dart';
import 'package:emdad_khodro_saipa/models/request_model/submit_emdad_request.dart';
import 'package:emdad_khodro_saipa/models/response_model/EmdadRequestResponse.dart';
import 'package:emdad_khodro_saipa/models/response_model/profile.dart';
import 'package:emdad_khodro_saipa/views/car_compact_drop_down.dart';
import 'package:emdad_khodro_saipa/views/pages/add_new_car.dart';
import 'package:emdad_khodro_saipa/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api_provider/provider.dart';
import '../../widgets/DialogWidgets.dart';
import '../../widgets/LoadingWidgets.dart';
import '../../widgets/custom_submit_button.dart';
import '../../widgets/custom_text_field.dart';
import '../drop_down.dart';
import 'package:emdad_khodro_saipa/globals.dart' as globals;

class SubmitEmdadRequest extends StatefulWidget {
  final String title;
  final String address;
  final bool hasCarProblem;
  final LatLng latLng;

  SubmitEmdadRequest({
    required this.title,
    this.address = '',
    required this.hasCarProblem,
    required this.latLng,
    Key? key,
  }) : super(key: key);

  @override
  State<SubmitEmdadRequest> createState() => _SubmitEmdadRequestState();
}

class _SubmitEmdadRequestState extends State<SubmitEmdadRequest> {
  bool _isPhysicalLimit = false;
  bool _isSpeechLimit = false;
  bool _isHearingLimit = false;
  bool _isMovementLimit = false;

  String limit = 'جسمی';

  Map<String, dynamic> carProblemListItem = {
    'ایراد خودرو': 'ایراد خودرو',
    'خودرو روشن نمی شود': 1,
    'تصادف کردم و نیاز به حمل دارم': 2,
    'تصادف کردم و نیاز به حمل ندارم خودرو روشن نمی شود': 3,
    'خودرو نیاز به قطعه دارد و در محل رفع عیب می شود': 4,
  };
  // Map<String, dynamic> carProblemListItem = {for (var item in globals.getProfile.data!.defects!) '${item.title}' : '${item.code}'};

  // Map<String, dynamic> carProblemListItem = globals.getProfile.data!.defects!.asMap();


  final TextEditingController _nameCtrl = TextEditingController(text: globals.getProfile.data!.firstName!);
  final TextEditingController _lastNameCtrl = TextEditingController(text: globals.getProfile.data!.lastName!);
  final TextEditingController _idCtrl = TextEditingController();
  final TextEditingController _chassisNoCtrl = TextEditingController();
  final TextEditingController _addressCtrl = TextEditingController();
  final TextEditingController _descriptionCtrl = TextEditingController();

  int? _carProblem;

  bool disabledName = true;
  bool disabledId = true;
  bool disabledAddress = true;
  bool disabledProblemCar = true;

  String? phone;
  String? fullName;
  String? nationalCode;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.address != '') {
      _addressCtrl.text = widget.address;
    }

    handleCarProblem();
    getAddress();
    // getUserData();
    getCarsData();
  }

  void handleCarProblem(){
    if(!widget.hasCarProblem){
      if(widget.title == 'امداد باتری'){
        _carProblem = 1;
      }
      if(widget.title == 'پنچری لاستیک'){
        _carProblem = 4;
      }
      if(widget.title == 'حمل خودرو'){
        _carProblem = 2;
      }
    }
  }

  void getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    phone = preferences.getString('user_phone_number');
    fullName = preferences.getString('user_full_name') ?? '';
    nationalCode = preferences.getString('user_national_code') ?? '';

    _nameCtrl.text = fullName!;
    _idCtrl.text = nationalCode!;
  }

  void getAddress() async {
    var result = await ApiProvider.getAddress(widget.latLng);

    setState(() {
      _addressCtrl.text = result.addressCompact!;
    });
  }

  Map<dynamic, dynamic> carModelListItem = {};
  List<CarInfos> myCarsList = [];
  final TextEditingController _carModelCtrl = TextEditingController();
  String? _carModelDefaultValue;

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
                  height: 10,
                ),
                Container(
                    // padding: EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    child: Text(
                      'ثبت درخواست ${widget.title}',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 4, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'انتخاب خودرو *',
                        textAlign: TextAlign.right,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddNewCar(isCarFromDataBase: false)));
                          },
                          child: Text(
                            'افزودن خودروی جدید +',
                            style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 4, left: 24, right: 24),
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
                    },
                  ),
                ),
                CustomTextField(title: 'نام *', height: 35, marginTop: 11, controller: _nameCtrl),
                CustomTextField(title: 'نام خانوادگی *', height: 35, marginTop: 11, controller: _lastNameCtrl),
                // CustomTextField(title: 'کدملی', height: 35, marginTop: 11, controller: _idCtrl),
                CustomTextField(title: 'شماره شاسی خودرو *', height: 35, marginTop: 11, controller: _chassisNoCtrl),
                if (widget.hasCarProblem) _customDropDown(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 11 / 520,
                ),
                _customCheckBox(
                  text: 'دارای محدودیت $limit می‌باشم',
                  value: _isPhysicalLimit,
                  onTap: (value) {
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
                _addressCtrl.text.isEmpty
                    ? CircularProgressIndicator(
                  color: Theme.of(context).accentColor,
                )
                    : CustomTextField(title: 'آدرس *', height: 47, marginTop: 11, controller: _addressCtrl),
                CustomTextField(title: 'توضیحات', height: 68, marginTop: 11, controller: _descriptionCtrl),

                // Expanded(child: Container()),
              ],
            ),
            //Todo if not responsive change size of textbox
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5 / 15,
            ),
            CustomSubmitButton(
              onTap: _onSubmitTap,
              text: 'ثبت درخواست',
              marginTop: 0,
              marginBottom: 0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _customDropDown() {
    return Container(
      margin: const EdgeInsets.only(
        right: 24,
        left: 24,
        top: 11,
      ),
      child: FormDropDown(
        readOnlyDropDown: false,
        primaryBackgroundColor: Colors.transparent,
        iconColor: Colors.pink,
        dropdownMenuItemStyle: const TextStyle(color: Colors.black),
        // defaultValue: _defaultValue,
        // firstItemSelectMessage: 'انتخاب',
        alignmentCenterLeft: false,
        enabledBorderColor: Colors.black,
        items: carProblemListItem,
        validations: const [],
        onChange: (value) {
          _carProblem = carProblemListItem[value];
        },
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
        Flexible(
          child: Text(
            text ?? '',
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
      ],
    );
  }

  _onSubmitTap() async {
    //check user info
    if(_nameCtrl.text.isEmpty || _lastNameCtrl.text.isEmpty){
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              dismissable: true,
              title: 'ورود اطلاعات',
              body: 'لطفا مشخصات خود را وارد نمائید.',
              positiveTxt: 'باشه',
            );
          });

      return;
    }

    //check car defect
    if (widget.hasCarProblem) {
      if (_carProblem == null) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return MessageDialogWidget(
                dismissable: true,
                title: 'ورود اطلاعات',
                body: 'لطفا ایراد خودرو را مشخص نمایید.',
                positiveTxt: 'باشه',
              );
            });

        return;
      }
    }

    if (_addressCtrl.text.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              dismissable: true,
              title: 'ورود اطلاعات',
              body: 'لطفا آدرس خود را وارد نمائید',
              positiveTxt: 'باشه',
            );
          });

      return;
    }
    // GeoLocation geoLocation = GeoLocation(lat: widget.latLng.latitude, long: widget.latLng.longitude);


    //loading dialog
    showDialog(context: context, builder: (BuildContext context){
      return CircleLoadingWidget(
        dismissable: false,
        msgTxt: 'لطفا منتظر بمانید',
      );
    });


    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token')!;
    //TODO add & fix api call for section
    globals.submitEmdadRequest.firstName = _nameCtrl.text;
    globals.submitEmdadRequest.lastName = _lastNameCtrl.text;
    globals.submitEmdadRequest.mobile = globals.getProfile.data!.mobileNumber!;
    globals.submitEmdadRequest.token = token;
    globals.submitEmdadRequest.chassisNo = _chassisNoCtrl.text;
    globals.submitEmdadRequest.latitude = widget.latLng.latitude;
    globals.submitEmdadRequest.longitude = widget.latLng.longitude;
    globals.submitEmdadRequest.address = _addressCtrl.text;
    globals.submitEmdadRequest.defectCode = _carProblem;
    globals.submitEmdadRequest.description = _descriptionCtrl.text;



    var result = await ApiProvider.submitEmdadRequest(globals.submitEmdadRequest);

    if(result.resultCode == 0){
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              dismissable: false,
              hasTextBody: false,
              widget: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('مشتری گرامی درخواست شما با موفقیت در سامانه ثبت گردید.', textAlign: TextAlign.center),
                    Text('همکاران ما بزودی با شما تماس خواهند گرفت.', textAlign: TextAlign.center),
                    Text(
                      'شماره همراه ثبت شده: $phone',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              positiveTxt: 'تایید',
              positiveFunc: () async {
                //save to user data
                SharedPreferences preferences = await SharedPreferences.getInstance();
                preferences.setString('user_full_name', _nameCtrl.text);
                preferences.setString('user_national_code', _idCtrl.text);

                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
              },
            );
          });

      //clear global variables
      globals.submitEmdadRequest.firstName = '';
      globals.submitEmdadRequest.lastName = '';
      globals.submitEmdadRequest.mobile = '';
      globals.submitEmdadRequest.token = '';
      globals.submitEmdadRequest.chassisNo = '';
      globals.submitEmdadRequest.latitude = 0.0;
      globals.submitEmdadRequest.longitude = 0.0;
      globals.submitEmdadRequest.address = '';
      globals.submitEmdadRequest.defectCode = -1;
      globals.submitEmdadRequest.description = '';

    }
    else{
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              dismissable: false,
              hasTextBody: false,
              widget: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('عملیات با خطا مواجه شد .لطفا مجددا تلاش کنید', textAlign: TextAlign.center),
                  ],
                ),
              ),
              positiveTxt: 'تایید',
              positiveFunc: () async {
                //save to user data
                // SharedPreferences preferences = await SharedPreferences.getInstance();
                // preferences.setString('user_full_name', _nameCtrl.text);
                // preferences.setString('user_national_code', _idCtrl.text);
                //
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
              },
            );
          });
      return;
    }









    // var res = await ApiProvider.sendEmdadRequest(geoLocation, _idCtrl.text, 'VAN123456789123', _carProblem!);

    /*
    if (res.resultCode == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              dismissable: false,
              hasTextBody: false,
              widget: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                        Text('مشتری گرامی اطلاعات شما با شماره پیگیری ${res.data!.trackingCode} در سامانه ثبت گردید.', textAlign: TextAlign.center),
                        Text('همکاران ما بزودی با شما تماس خواهند گرفت.', textAlign: TextAlign.center),
                        Text(
                          'شماره همراه ثبت شده: $phone',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  positiveTxt: 'تایید',
                  positiveFunc: () async {
                    //save to user data
                    SharedPreferences preferences = await SharedPreferences.getInstance();
                    preferences.setString('user_full_name', _nameCtrl.text);
                    preferences.setString('user_national_code', _idCtrl.text);

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                  },
                );
              });
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return MessageDialogWidget(
                  dismissable: false,
                  hasTextBody: false,
                  widget: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('عملیات با خطا مواجه شد .لطفا مجددا تلاش کنید', textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  positiveTxt: 'تایید',
                  positiveFunc: () async {
                    //save to user data
                    SharedPreferences preferences = await SharedPreferences.getInstance();
                    preferences.setString('user_full_name', _nameCtrl.text);
                    preferences.setString('user_national_code', _idCtrl.text);

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                  },
                );
              });
        }

     */


  }
}
