import 'package:emdad_khodro_saipa/views/car_compact_drop_down.dart';
import 'package:emdad_khodro_saipa/views/pages/DevelopingPage.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/car_charge/car_charge_result.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/car_toll/car_toll_result.dart';
import 'package:flutter/material.dart';
import 'package:emdad_khodro_saipa/views/pages/add_new_car.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../data_base/hive_db.dart';
import '../../../../../widgets/DialogWidgets.dart';
import '../../../../../widgets/LoadingWidgets.dart';
import '../../../../../widgets/custom_submit_button.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../../../../drop_down.dart';

class CarCharge extends StatefulWidget {
  const CarCharge({Key? key}) : super(key: key);

  @override
  State<CarCharge> createState() => _CarChargeState();
}

class _CarChargeState extends State<CarCharge> {

  String? _carModelDefaultValue;
  final TextEditingController _carModelController = TextEditingController();

  TextEditingController _userPhoneController = TextEditingController();
  TextEditingController _userNationalCodeController = TextEditingController();

  List myCarsList = [];
  Map<String, dynamic> userCarsItem = {};
  Map<dynamic, dynamic> carModelListItem = {};
  final TextEditingController _carModelCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCarsData();
    getUserData();
  }

  getCarsData()async{
    HiveDB _hiveDB = HiveDB();
    myCarsList = await _hiveDB.getData('', 'userBox');

    print('this is mycarsList==== > ${myCarsList.length}');

    if(myCarsList.isEmpty){
      final entry = {'مدل خودرو':'مدل خودرو'};
      carModelListItem.addEntries(entry.entries);
      setState(() {});
      return;
    }
    myCarsList.forEach((element) {
      final entry = {element: element};
      carModelListItem.addEntries(entry.entries);
    });
    _carModelCtrl.text = '${myCarsList.first.brand} - ${myCarsList.first.createDate}';

    setState(() {});
    return;
  }

  getUserData()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _userPhoneController.text = preferences.getString('user_phone_number') ?? '';
    _userNationalCodeController.text = preferences.getString('user_national_code') ?? '';
  }

  Future<void> _onSubmitTap() async {
    //check value - validation
    if(_userNationalCodeController.text.isEmpty || _userPhoneController.text.isEmpty){
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              body: 'فیلدها نباید خالی باشد',
              dismissable: true,
              positiveTxt: 'باشه',
              positiveFunc: () async {},
            );
          });
      return;
    }

    //show loading for 3 sec
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CircleLoadingWidget(
            dismissable: false,
            msgTxt: 'لطفا منتظر بمانید',
          );
        });

    await Future.delayed(const Duration(milliseconds: 2000));
    Navigator.of(context).pop();


    //


    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const CarChargeResult(),
        // builder: (BuildContext context) => const DevelopingPage(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          'خلافی خودرو',
          // style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        // backgroundColor: secondary_dark_purple_color,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
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
                            Navigator.pop(context);
                            // Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddNewCar(isCarFromDataBase: false)));
                          },
                          child: Text('افزودن خودروی جدید +', style: TextStyle(fontSize: 14,color: Theme.of(context).primaryColor),)),

                    ],
                  ),

                  CarCompactDropDown(
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
                      _carModelController.text = value;
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            CustomTextField(
              title: 'شماره موبایل (مالک خودرو) *',
              height: 28,
              hintText: '09xxxxxxxxx',
              textInputType: TextInputType.phone,
              controller: _userPhoneController,
            ),
            SizedBox(
              height: 8,
            ),
            CustomTextField(
              title: 'کد ملی (مالک خودرو) *',
              height: 28,
              textInputType: TextInputType.number,
              controller: _userNationalCodeController,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5 / 15,
            ),
            CustomSubmitButton(onTap: _onSubmitTap, text: 'استعلام'),
          ],
        ),
      ),
    );
  }
}


