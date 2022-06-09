import 'package:emdad_khodro_saipa/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api_provider/provider.dart';
import '../../../constants.dart';
import '../../widgets/DialogWidgets.dart';
import '../../widgets/LoadingWidgets.dart';
import '../../widgets/custom_submit_button.dart';
import '../../widgets/custom_text_field.dart';
import '../drop_down.dart';

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
    'ماشینم روشن نمیشه': 'ماشینم روشن نمیشه',
    'باطری خالی کردم': 'باطری خالی کردم',
    'مطمئن نیستم': 'مطمئن نیستم',
    'سایر': 'سایر',
  };

  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _idCtrl = TextEditingController();
  final TextEditingController _addressCtrl = TextEditingController();
  final TextEditingController _descriptionCtrl = TextEditingController();

  String? _carProblem;

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

    getAddress();
    getUserData();
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


     setState((){
       _addressCtrl.text = result.addressCompact!;
     });
  }

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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                SizedBox(
                  height: 8,
                ),
                CustomTextField(
                    title: 'نام و نام خانوادگی *',
                    height: 35,
                    marginTop: 11,
                    controller: _nameCtrl),
                CustomTextField(
                    title: 'کدملی *',
                    height: 35,
                    marginTop: 11,
                    controller: _idCtrl),
                if (widget.hasCarProblem) _customDropDown(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 11 / 520,
                ),
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
                _addressCtrl.text.isEmpty
                    ? CircularProgressIndicator(
                        color: Theme.of(context).accentColor,
                      )
                    : CustomTextField(
                        title: 'آدرس *',
                        height: 47,
                        marginTop: 11,
                        controller: _addressCtrl),
                CustomTextField(
                    title: 'توضیحات',
                    height: 68,
                    marginTop: 11,
                    controller: _descriptionCtrl),

                // Expanded(child: Container()),
              ],
            ),
            //Todo if not responsive change size of textbox
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5 / 15,
            ),
            CustomSubmitButton(onTap: _onSubmitTap, text: 'ثبت درخواست',marginTop: 0,marginBottom: 0,),
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
          _carProblem = value;
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
        Text(
          text ?? '',
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }



  _onSubmitTap() async {
    print('carprob + $_carProblem');
    print('name + ${_nameCtrl.text}');
    print('id + ${_idCtrl.text}');
    print('address + ${_addressCtrl.text}');
    if (_nameCtrl.text.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              dismissable: true,
              title: 'ورود اطلاعات',
              body: 'لطفا نام و نام خانوادگی خود را وارد نمائید',
              positiveTxt: 'باشه',
            );
          });

      return;
    }
    if (_idCtrl.text.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              dismissable: true,
              title: 'ورود اطلاعات',
              body: 'لطفا کدملی خود را وارد نمائید',
              positiveTxt: 'باشه',
            );
          });

      return;
    }
    if (widget.hasCarProblem) {
      if (_carProblem == null) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return MessageDialogWidget(
                dismissable: true,
                title: 'ورود اطلاعات',
                body: 'لطفا ایراد ماشین را مشخص نمایید.',
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

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CircleLoadingWidget(
            dismissable: false,
            msgTxt: 'لطفا منتظر بمانید',
          );
        });

    //clear textFields
    // _idCtrl.clear();
    // _nameCtrl.clear();

    await Future.delayed(const Duration(milliseconds: 4000));

    Navigator.of(context).pop();

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
                  Text(
                      'مشتری گرامی اطلاعات شما با شماره پیگیری 98995 در سامانه ثبت گردید.',
                      textAlign: TextAlign.center),
                  Text('همکاران ما بزودی با شما تماس خواهند گرفت.',
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
              //save to user data
              SharedPreferences preferences =
              await SharedPreferences.getInstance();
              preferences.setString('user_full_name', _nameCtrl.text);
              preferences.setString('user_national_code', _idCtrl.text);

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()));
            },
          );
        });
  }
}
