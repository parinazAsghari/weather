import 'package:emdad_khodro_saipa/constants.dart';
import 'package:emdad_khodro_saipa/data_base/hive_db.dart';
import 'package:emdad_khodro_saipa/models/car.dart';
import 'package:emdad_khodro_saipa/views/pages/drop_down.dart';
import 'package:emdad_khodro_saipa/views/pages/home_page.dart';
import 'package:emdad_khodro_saipa/views/widgets/DialogWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AddNewCar extends StatefulWidget {
  const AddNewCar({Key? key, required this.isCarFromDataBase,  this.chassisNumber,  this.ownerNationalCode,  this.brand,  this.createDate,  this.firstCarTag,  this.secondCarTag,  this.thirdCarTag,  this.fourthCarTag}) : super(key: key);
  final bool isCarFromDataBase;
  final String? chassisNumber;
  final String? ownerNationalCode;
  final String? brand;
  final String? createDate;
  final int? firstCarTag;
  final String? secondCarTag;
  final int? thirdCarTag;
  final int? fourthCarTag;

  @override
  State<AddNewCar> createState() => _AddNewCarState();
}

class _AddNewCarState extends State<AddNewCar> {
  final FocusNode _firstNumberNode = FocusNode();
  final FocusNode _secondNumberNode = FocusNode();
  final FocusNode _thirdNumberNode = FocusNode();
  final FocusNode _fourthNumberNode = FocusNode();
  final FocusNode _fifthNumberNode = FocusNode();
  final FocusNode _sixthNumberNode = FocusNode();
  final FocusNode _seventhNumberNode = FocusNode();
  final FocusNode _eighthNumberNode = FocusNode();
  Map<String, dynamic> createYearListItem = {'': null, '1390': null,'1387':null};
  Map<String, dynamic> carModelListItem = {'': 'مدل خودرو', 'ساینا': 'ساینا','کوییک':'کوییک','پراید':'پراید','تیبا':'تیبا','وانت':'وانت','سراتو':'سراتو','چانگان':'چانگان','شاهین':'شاهین'};
  List<String> pelakListItem = ['','الف', 'ب','پ','ت','ث','ج','چ','ح','خ','د','ذ','ر','ز','ژ','س','ش','ع','غ','ف','ق','ک','ل','م','ن','و','ه','ی'];
  var pelakDropDownValue;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _chassisNumberController = TextEditingController();
  final TextEditingController _nationalCodeController = TextEditingController();
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  final TextEditingController _thirdNumberController = TextEditingController();
  final TextEditingController _fourthNumberController = TextEditingController();
  final TextEditingController _fifthNumberController = TextEditingController();
  final TextEditingController _sixthNumberController = TextEditingController();
  final TextEditingController _seventhNumberController = TextEditingController();

  final TextEditingController _dropDownTagController = TextEditingController();
  final TextEditingController _carModelController = TextEditingController();
  final TextEditingController _createDateController = TextEditingController();

  String? _carModelDefaultValue;
  String? _carCreateDateDefaultValue;
  String? _carTagDefaultValue;


  @override
  void initState() {
    pelakDropDownValue = pelakListItem.first;
    if(widget.isCarFromDataBase){
      _chassisNumberController.text = widget.chassisNumber!;
      _nationalCodeController.text = widget.ownerNationalCode!;
      _firstNumberController.text = widget.firstCarTag.toString().characters.first;
      _secondNumberController.text = widget.firstCarTag.toString().characters.last;
      _thirdNumberController.text = widget.thirdCarTag.toString().characters.first;
      _fourthNumberController.text = widget.thirdCarTag.toString().substring(1,2).characters.first;
      _fifthNumberController.text =widget.thirdCarTag.toString().characters.last;
      _sixthNumberController.text = widget.fourthCarTag.toString().characters.first;
      _seventhNumberController.text = widget.fourthCarTag.toString().characters.last;
      _carModelDefaultValue = widget.brand;
      _carCreateDateDefaultValue = widget.createDate;
      _carTagDefaultValue = widget.secondCarTag;
      print(_carTagDefaultValue);
    }
    super.initState();
  }

  late final GlobalKey _dropdownButtonKey = GlobalKey();

  void openDropdown() {
    GestureDetector? detector;
    searchForGestureDetector(BuildContext? element) {
      element!.visitChildElements((element) {
        if (element.widget != null && element.widget is GestureDetector) {
          detector = element.widget as GestureDetector?;
          // return false;

        } else {
          searchForGestureDetector(element);
        }

        // return true;
      });
    }

    searchForGestureDetector(_dropdownButtonKey.currentContext);
    assert(detector != null);

    detector!.onTap!();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primary_grey_color,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('مشخصات خودرو'),
        // backgroundColor: secondary_dark_purple_color,
      ),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Spacer(),
                    Text('مشخصات خودرو خود را وارد کنید'),
                    Spacer(
                      flex: 9,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(color: Theme.of(context).primaryColorLight, borderRadius: BorderRadius.circular(30)),
                  child: Image.asset(
                    'assets/images/khodro.png',
                    width: 35,
                    height: 50,
                    // fit: BoxFit.cover,
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('مدل خودرو'),
                          FormDropDown(
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
                              _carModelController.text = value;
                            },
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('سال ساخت'),
                          FormDropDown(
                            readOnlyDropDown: false,
                            primaryBackgroundColor: Colors.transparent,
                            iconColor: Colors.pink,
                            dropdownMenuItemStyle: const TextStyle(color: Colors.black),
                            defaultValue: _carCreateDateDefaultValue,
                            // firstItemSelectMessage: 'انتخاب',
                            alignmentCenterLeft: false,
                            enabledBorderColor: Colors.black,
                            items: createYearListItem,
                            validations: [],
                            onChange: (value) {
                              _createDateController.text = value;
                            },
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('شماره شاسی'),
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              controller: _chassisNumberController,
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              decoration: InputDecoration(
                                // labelText: 'شماره شاسی',
                                //   labelStyle:const TextStyle(color: Colors.black) ,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black, width: 0.4),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                // hintText: 'شماره شاسی', hintStyle: const TextStyle(color: Colors.black,), contentPadding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10)
                              ),
                              // showCursor: false,
                              cursorColor: Colors.deepOrange,
                              validator: (String? val) {
                                // if (val != null) {
                                //   return 'خالی نباشد';
                                // }
                                // return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('کد ملی مالک'),
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              controller: _nationalCodeController,
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              decoration: InputDecoration(
                                // labelText: 'کد ملی مالک',
                                // labelStyle:const TextStyle(color: Colors.black) ,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black, width: 0.4),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                // hintText: 'کد ملی مالک',
                                hintStyle: const TextStyle(color: Colors.black),
                                contentPadding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                              ),
                              // showCursor: false,
                              cursorColor: Colors.deepOrange,
                              validator: (String? val) {
                                // if (val != null) {
                                //   return 'خالی نباشد';
                                // }
                                // return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                        flex: 7,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                width: 60,
                                height: 50,
                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.black, width: 0.4)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      const Text(
                                        'ایران',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 15,
                                              child: TextFormField(
                                                controller: _seventhNumberController,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(1),
                                                ],
                                                focusNode: _eighthNumberNode,
                                                onChanged: (String val) {
                                                  // if (val.isNotEmpty) {
                                                  //   _eighthNumberNode.unfocus();
                                                  //   // FocusScope.of(context).requestFocus(_sixthNumberNode);
                                                  // }
                                                },
                                                keyboardType: TextInputType.number,
                                                maxLines: 1,
                                                // decoration: const InputDecoration(
                                                //   border: InputBorder.none,
                                                // ),
                                                showCursor: false,
                                                validator: (String? val) {
                                                  // if (val != null) {
                                                  //   return 'خالی نباشد';
                                                  // }
                                                  // return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            SizedBox(
                                              width: 15,
                                              child: TextFormField(
                                                controller: _sixthNumberController,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(1),
                                                ],
                                                focusNode: _seventhNumberNode,
                                                onChanged: (String val) {
                                                  if (val.isNotEmpty) {
                                                    _seventhNumberNode.unfocus();
                                                    FocusScope.of(context).requestFocus(_eighthNumberNode);
                                                  }
                                                },
                                                keyboardType: TextInputType.number,
                                                maxLines: 1,
                                                // decoration: const InputDecoration(
                                                //   border: InputBorder.none,
                                                // ),
                                                showCursor: false,
                                                validator: (String? val) {
                                                  // if (val != null) {
                                                  //   return 'خالی نباشد';
                                                  // }
                                                  // return null;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 3,
                              child: SizedBox(
                                width: 95,
                                height: 50,
                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.black, width: 0.4)),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 15,
                                              child: TextFormField(
                                                controller: _fifthNumberController,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(1),
                                                ],
                                                onChanged: (String val) {
                                                  if (val.isNotEmpty) {
                                                    _sixthNumberNode.unfocus();
                                                    FocusScope.of(context).requestFocus(_seventhNumberNode);
                                                  }
                                                },
                                                focusNode: _sixthNumberNode,
                                                keyboardType: TextInputType.number,
                                                maxLines: 1,
                                                // decoration: const InputDecoration(
                                                //   border: InputBorder.none,
                                                // ),
                                                showCursor: false,
                                                validator: (String? val) {
                                                  // if (val != null) {
                                                  //   return 'خالی نباشد';
                                                  // }
                                                  // return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            SizedBox(
                                              width: 15,
                                              child: TextFormField(
                                                controller: _fourthNumberController,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(1),
                                                ],
                                                focusNode: _fifthNumberNode,
                                                onChanged: (String val) {
                                                  if (val.isNotEmpty) {
                                                    _fifthNumberNode.unfocus();
                                                    FocusScope.of(context).requestFocus(_sixthNumberNode);
                                                  }
                                                },
                                                keyboardType: TextInputType.number,
                                                maxLines: 1,
                                                // decoration: const InputDecoration(
                                                //   border: InputBorder.none,
                                                // ),
                                                showCursor: false,
                                                validator: (String? val) {
                                                  // if (val != null) {
                                                  //   return 'خالی نباشد';
                                                  // }
                                                  // return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            SizedBox(
                                              width: 15,
                                              child: TextFormField(
                                                controller: _thirdNumberController,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(1),
                                                ],
                                                onChanged: (String val) {
                                                  if (val.isNotEmpty) {
                                                    _fourthNumberNode.unfocus();
                                                    FocusScope.of(context).requestFocus(_fifthNumberNode);
                                                  }
                                                },
                                                focusNode: _fourthNumberNode,
                                                keyboardType: TextInputType.number,
                                                maxLines: 1,
                                                // decoration: const InputDecoration(
                                                //   border: InputBorder.none,
                                                // ),
                                                showCursor: false,
                                                validator: (String? val) {
                                                  // if (val != null) {
                                                  //   return 'خالی نباشد';
                                                  // }
                                                  // return null;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.black, width: 0.4, style: BorderStyle.solid)),
                                  child: DropdownButtonHideUnderline(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Theme(
                                        data: Theme.of(context).copyWith(
                                          hoverColor: Colors.transparent,
                                        ),
                                        child: DropdownButton<String>(
                                          icon: Icon(Icons.arrow_drop_down, color: dark_theme_secondary),
                                          isDense: true,
                                          key: _dropdownButtonKey,
                                          focusNode: _thirdNumberNode,
                                          isExpanded: true,
                                          focusColor: Colors.transparent,
                                          borderRadius: BorderRadius.zero,
                                          value:widget.isCarFromDataBase?  _carTagDefaultValue : pelakDropDownValue,
                                          // borderRadius: BorderRadius.circular(12),
                                          items: pelakListItem.map((String value) {
                                            return DropdownMenuItem<String>(
                                              value:value,
                                              child: Padding(
                                                padding: const EdgeInsets.only(right: 5.0),
                                                child: Text(
                                                  value,
                                                  style: const TextStyle(fontSize: 15),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            _dropDownTagController.text = value!;
                                            setState(() {
                                              pelakDropDownValue = value;
                                              FocusScope.of(context).requestFocus(_fourthNumberNode);
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                width: 80,
                                height: 50,
                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.black, width: 0.4)),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 15,
                                              child: TextFormField(
                                                controller: _secondNumberController,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(1),
                                                ],
                                                onChanged: (String val) {
                                                  if (val.isNotEmpty) {
                                                    openDropdown();
                                                    // _secondNumberNode.unfocus();
                                                    // FocusScope.of(context).requestFocus(_thirdNumberNode);
                                                    // FocusScope.of(context).nearestScope;
                                                  }
                                                },

                                                focusNode: _secondNumberNode,
                                                keyboardType: TextInputType.number,
                                                maxLines: 1,
                                                // decoration: const InputDecoration(
                                                //   border: InputBorder.none,
                                                // ),
                                                showCursor: false,
                                                validator: (String? val) {},
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            SizedBox(
                                              width: 15,
                                              child: TextFormField(
                                                controller: _firstNumberController,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(1),
                                                ],
                                                onChanged: (String val) {
                                                  if (val.isNotEmpty) {
                                                    _firstNumberNode.unfocus();
                                                    FocusScope.of(context).requestFocus(_secondNumberNode);
                                                  }
                                                },
                                                // decoration: const InputDecoration(
                                                //   border: InputBorder.none,
                                                // ),
                                                showCursor: false,
                                                autofocus: false,
                                                focusNode: _firstNumberNode,
                                                keyboardType: TextInputType.number,
                                                maxLines: 1,
                                                validator: (String? val) {
                                                  // if (val != null) {
                                                  //   return 'خالی نباشد';
                                                  // }
                                                  // return null;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 1,
                                child: Image.asset(
                                  'assets/images/iran_flag.png',
                                  width: 35,
                                  height: 50,
                                  fit: BoxFit.cover,
                                )),
                          ],
                        )),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 3,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                              // primary: secondary_light_grey_color
                              ),
                          onPressed: ()async {
                            if (_chassisNumberController.text.isEmpty &&
                                _nationalCodeController.text.isEmpty &&
                                _firstNumberController.text.isEmpty &&
                                _secondNumberController.text.isEmpty &&
                                _thirdNumberController.text.isEmpty &&
                                _fourthNumberController.text.isEmpty &&
                                _fifthNumberController.text.isEmpty &&
                                _sixthNumberController.text.isEmpty &&
                                _seventhNumberController.text.isEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return MessageDialogWidget(
                                      body: 'فیلدها نباید خالی باشد',
                                      dismissable: true,
                                      positiveTxt: 'باشه',
                                      positiveFunc: () async {
                                      },
                                    );
                                  });

                            }else{
                              Car car = Car();
                              car.chassisNumber = _chassisNumberController.text;
                              car.ownerNationalCode =_nationalCodeController.text;
                              car.brand = _carModelController.text;
                              car.createDate =_createDateController.text;
                              car.id =1;
                              car.firstCarTag =int.parse((_firstNumberController.text+_secondNumberController.text));
                              car.secondCarTag =_dropDownTagController.text;
                              car.thirdCarTag =int.parse((_thirdNumberController.text+_fourthNumberController.text+_fifthNumberController.text));
                              car.fourthCarTag =int.parse((_sixthNumberController.text+_seventhNumberController.text));
                              print(car.chassisNumber);
                              print(car.ownerNationalCode);
                              print(car.brand);
                              print(car.createDate);
                              print(car.id);
                              print(car.firstCarTag);
                              print(car.secondCarTag);
                              print(car.thirdCarTag);
                              print(car.fourthCarTag);
                              HiveDB _hiveDb = HiveDB();
                              await _hiveDb.addData(car, 'userBox');
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return MessageDialogWidget(
                                      body: 'اطلاعات شما با موفقیت ثبت شد',
                                      dismissable: true,
                                      positiveTxt: 'باشه',
                                      positiveFunc: () async {
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                                      },
                                    );
                                  });
                            }
                            ;
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'ثبت',
                              style: TextStyle(
                                  // color: primary_grey_color
                                  ),
                            ),
                          )),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
