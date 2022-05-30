import 'package:emdad_khodro_saipa/constants.dart';
import 'package:emdad_khodro_saipa/views/pages/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DevelopingPage extends StatefulWidget {
  const DevelopingPage({Key? key}) : super(key: key);

  @override
  State<DevelopingPage> createState() => _DevelopingPageState();
}

class _DevelopingPageState extends State<DevelopingPage> {
  final FocusNode _firstNumberNode = FocusNode();
  final FocusNode _secondNumberNode = FocusNode();
  final FocusNode _thirdNumberNode = FocusNode();
  final FocusNode _fourthNumberNode = FocusNode();
  final FocusNode _fifthNumberNode = FocusNode();
  final FocusNode _sixthNumberNode = FocusNode();
  final FocusNode _seventhNumberNode = FocusNode();
  final FocusNode _eighthNumberNode = FocusNode();
  Map<String, dynamic> carColorListItem = {'رنگ ماشین': null, 'سرمه ای': null};
  Map<String, dynamic> carModelListItem = {'مدل ماشین': 'مدل ماشین', 'ساینا': 'ساینا'};
  List<String> pelakListItem = ['الف','ب'];
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

@override
  void initState() {
   pelakDropDownValue = pelakListItem.first;
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
        // backgroundColor: secondary_dark_purple_color,
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                  height: 20,
                ),
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('مدل ماشین'),
                          FormDropDown(
                            readOnlyDropDown: false,
                            primaryBackgroundColor: Colors.transparent,
                            iconColor: Colors.pink,
                            dropdownMenuItemStyle: const TextStyle(color: Colors.black),
                            // defaultValue: _defaultValue,
                            // firstItemSelectMessage: 'انتخاب',
                            alignmentCenterLeft: false,
                            enabledBorderColor: Colors.black,
                            items: carModelListItem,
                            validations: const [],
                            onChange: (value) {},
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('رنگ ماشین'),
                          FormDropDown(
                            readOnlyDropDown: false,
                            primaryBackgroundColor: Colors.transparent,
                            iconColor: Colors.pink,
                            dropdownMenuItemStyle: const TextStyle(color: Colors.black),
                            // defaultValue: _defaultValue,
                            // firstItemSelectMessage: 'انتخاب',
                            alignmentCenterLeft: false,
                            enabledBorderColor: Colors.black,
                            items: carColorListItem,
                            validations: [],
                            onChange: (value) {},
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 20,
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
                                  focusedBorder:OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black, width: 0.4),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                  ),
                                  hintText: 'شماره شاسی', hintStyle: const TextStyle(color: Colors.black,), contentPadding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10)
                              ),
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
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 20,
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
                                      const Text('ایران',style: TextStyle(color: Colors.black),),
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
                                            const SizedBox(width: 2,),
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
                                      const SizedBox(height: 15,),
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
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.black, width: 0.4,style: BorderStyle.solid)),
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
                                          focusNode:_thirdNumberNode ,
                                          isExpanded: true,
                                          focusColor: Colors.transparent,
                                          borderRadius: BorderRadius.zero,
                                          value:pelakDropDownValue ,
                                          // borderRadius: BorderRadius.circular(12),
                                          items: pelakListItem.map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value,style: const TextStyle(fontSize: 15),),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
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
                                                validator: (String? val) {
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 2,),
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
                                                autofocus: true,
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
                                      const SizedBox(height: 15,),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(flex:1,child: Image.asset('assets/images/iran_flag.png', width: 35,height: 50, fit: BoxFit.cover,)),
                          ],
                        )
                    ),
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
                                labelText: 'کد ملی مالک',
                                labelStyle:const TextStyle(color: Colors.black) ,
                                focusedBorder:OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black, width: 0.4),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                hintText: 'کد ملی مالک',
                                hintStyle: const TextStyle(color: Colors.black),
                                contentPadding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                              ),
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
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 7,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              // primary: secondary_light_grey_color
                              ),
                          onPressed: () {
                            if (_chassisNumberController.text.isEmpty && _nationalCodeController.text.isEmpty
                            && _firstNumberController.text.isEmpty &&
                                _secondNumberController.text.isEmpty &&
                                _thirdNumberController.text.isEmpty &&
                                _fourthNumberController.text.isEmpty &&
                                _fifthNumberController.text.isEmpty &&
                                _sixthNumberController.text.isEmpty &&
                                _seventhNumberController.text.isEmpty) {
                              print('on tap');
                            };
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
