import 'package:emdad_khodro_saipa/views/pages/DevelopingPage.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/car_toll/car_toll_result.dart';
import 'package:flutter/material.dart';
import 'package:emdad_khodro_saipa/views/pages/add_new_car.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../data_base/hive_db.dart';
import '../../../../../widgets/custom_submit_button.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../../../../drop_down.dart';

class CarToll extends StatefulWidget {
  const CarToll({Key? key}) : super(key: key);

  @override
  State<CarToll> createState() => _CarTollState();
}

class _CarTollState extends State<CarToll> {

  String? _carModelDefaultValue;
  final TextEditingController _carModelController = TextEditingController();

  TextEditingController _userPhoneController = TextEditingController();


  List myCarsList = [];
  Map<String, dynamic> userCarsItem = {};
  Map<String, dynamic> carModelListItem = {};
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
      final entry = {'${element.brand} - ${element.createDate}': '${element.brand} - ${element.createDate}'};
      carModelListItem.addEntries(entry.entries);
    });
    _carModelCtrl.text = '${myCarsList.first.brand} - ${myCarsList.first.createDate}';

    setState(() {});
    return;
  }

  getUserData()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _userPhoneController.text = preferences.getString('user_phone_number') ?? '';
  }

  void _onSubmitTap(){

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        // builder: (BuildContext context) => const CarTollResult(),
        builder: (BuildContext context) => const DevelopingPage(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          'عوارض خودرو',
          // style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        // backgroundColor: secondary_dark_purple_color,
      ),
      body: _body(),
    );
  }
  Widget _body() {
    return Container(
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
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddNewCar(isCarFromDataBase: false)));
                        },
                        child: Text('افزودن خودروی جدید +', style: TextStyle(fontSize: 14,color: Theme.of(context).primaryColor),)),

                  ],
                ),

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
                    _carModelCtrl.text = value;
                    _carModelController.text = value;
                  },
                ),


              ],
            ),
          ),
          CustomTextField(
            title: 'شماره موبایل',
            height: 28,
            controller: _userPhoneController,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5 / 15,
          ),
          CustomSubmitButton(onTap: _onSubmitTap, text: 'استعلام'),
        ],
      ),
    );
  }
}


