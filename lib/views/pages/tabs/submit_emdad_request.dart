import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../widgets/DialogWidgets.dart';
import '../drop_down.dart';

class SubmitEmdadRequest extends StatefulWidget {
  final String title;
  final String address;
  final bool hasCarProblem;

  SubmitEmdadRequest({
    required this.title,
    this.address = '',
    required this.hasCarProblem,
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
    'ایراد ماشین': 'ایراد ماشین',
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

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if(widget.address!=''){
      _addressCtrl.text = widget.address;
    }
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
                  height: MediaQuery.of(context).size.height * 20 / 520,
                ),
                Container(padding: EdgeInsets.only(right: 10),alignment: Alignment.centerRight,child: Text('ثبت درخواست ${widget.title}',)),
                _customTextField(
                  title: 'نام و نام خانوادگی',
                  controller: _nameCtrl,
                ),
                _customTextField(title: 'کدملی', controller: _idCtrl),
                if(widget.hasCarProblem)
                  _customDropDown(),
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
                            positiveTxt: 'باشه',
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
                _customTextField(
                    title: 'آدرس', height: 47, controller: _addressCtrl),
                _customTextField(
                    title: 'توضیحات', height: 68, controller: _descriptionCtrl),
                // Expanded(child: Container()),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 1 / 10,
            ),
            _submitButton(),
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

  Widget _customTextField(
      {@required String? title, double height = 45, controller}) {
    return Container(
      margin: const EdgeInsets.only(
        right: 24,
        left: 24,
        top: 11,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(title ?? ''),
          isDense: true,
          contentPadding: EdgeInsets.only(top: height, right: 10),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () {
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
        if(widget.hasCarProblem){
          if (_carProblem == null) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return MessageDialogWidget(
                    dismissable: true,
                    title: 'ورود اطلاعات',
                    body: 'لطفا ایراد ماشین ا مشخص کنید.',
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
        margin: const EdgeInsets.only(right: 24, left: 24, bottom: 0),
        child: const Text(
          'ثبت درخواست',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
