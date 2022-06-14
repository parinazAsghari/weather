import 'package:emdad_khodro_saipa/constants.dart';
import 'package:flutter/material.dart';
import 'package:emdad_khodro_saipa/views/pages/add_new_car.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../data_base/hive_db.dart';
import '../../../../../widgets/custom_neomorphic_box.dart';
import '../../../../../widgets/custom_submit_button.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../../../../drop_down.dart';

class CarTollResult extends StatefulWidget {
  const CarTollResult({Key? key}) : super(key: key);

  @override
  State<CarTollResult> createState() => _CarTollResultState();
}

class _CarTollResultState extends State<CarTollResult> {

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
          CustomNeomorphicBox(
            title: '',
            index: 0,
            selectedIndex: 1,
            isFull: true,
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SubmitOnSiteService()));
            },
            height: 75 / 640,
            marginTop: 8,
            marginRight: 28,
            marginLeft: 0,
            marginBottom: 0,
            isChildText: false,
            widget: _carTollItem('عوارض شهرداری تهران'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5 / 15,
          ),
          CustomSubmitButton(onTap: _onSubmitTap, text: 'استعلام'),
        ],
      ),
    );
  }

  Widget _carTollItem(String title){
    return Container(
      margin: EdgeInsets.all(defaultPadding),
      width: 200,
      height: 190,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(title),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('10000 تومان'),
              SizedBox(width: defaultPadding,),

              CustomSubmitButton(onTap: (){}, text: 'پرداخت',)
            ],
          )
        ],
      ),
    );
  }

}


