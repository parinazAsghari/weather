import 'package:emdad_khodro_saipa/views/pages/home_page.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/on_site_emdad/choose_relief_worker_page.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/on_site_emdad/emdad_on_site_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../api_provider/provider.dart';
import '../../../../../../constants.dart';
import '../../../../../widgets/DialogWidgets.dart';
import '../../../../../widgets/LoadingWidgets.dart';
import '../../../../drop_down.dart';

class SubmitAddress extends StatefulWidget {
  String? address;
   LatLng? latLng;
  SubmitAddress({
    this.address,
    this.latLng,
    Key? key,
  }) : super(key: key);

  @override
  State<SubmitAddress> createState() => _SubmitAddressState();
}

class _SubmitAddressState extends State<SubmitAddress> {
  final TextEditingController _addressCtrl = TextEditingController();

  String? phone;
  String? fullName;
  String? nationalCode;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _addressCtrl.text = widget.latLng.toString();
    super.initState();
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
                _customTextField(
                  title: 'آدرس *',
                  controller: _addressCtrl,
                  height: 111
                ),

                //Todo if not responsive change size of textbox
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5 / 15,
                ),
                _submitButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _customTextField(
      {@required String? title, double height = 35, controller}) {
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
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () async {
        print('carmodel + ${_addressCtrl.text}');
        if (_addressCtrl.text.isEmpty) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return MessageDialogWidget(
                  dismissable: true,
                  title: 'ورود اطلاعات',
                  body: 'لطفا مدل آدرس خود را وارد نمائید',
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

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    ChooseReliefWorkerPage(),),);

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
