import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/emdad_in_place/widget/custom_submit_button.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/emdad_in_place/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../../api_provider/provider.dart';
import '../../../../../../constants.dart';
import '../../../../../widgets/DialogWidgets.dart';
import '../../../../../widgets/LoadingWidgets.dart';
import 'choose_day_page.dart';
import 'choose_relief_worker_page.dart';

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

  bool _chooseWorker = false;

  @override
  void initState() {
    callApi(widget.latLng!);
    super.initState();
  }

  void callApi(LatLng latLng) async {
    print('this is latlng ===>>>>>>> $latLng');
    var result = await ApiProvider.getAddress(latLng);

    _addressCtrl.text = result.addressCompact!;

    setState(() {});
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
                const SizedBox(
                  height: 19,
                ),
                Container(
                    // padding: EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    child: const Text(
                      'آدرس دقیق',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                const SizedBox(
                  height: 8,
                ),
                _addressCtrl.text.isNotEmpty
                    ? CustomTextField(
                        title: 'آدرس *',
                        height: 111,
                        controller: _addressCtrl,
                      )
                    : CircularProgressIndicator(
                        color: dark_theme_secondary,
                      ),

                _customCheckBox(),

                //Todo if not responsive change size of textbox
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.5 / 15,
                // ),
                CustomSubmitButton(
                  onTap: onSubmitTap,
                  text: 'ثبت آدرس',
                  marginBottom: 0,
                  marginTop: 0,
                ),
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

  Widget _customCheckBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
              value: _chooseWorker,
              onChanged: (value) {
                setState(() {
                  _chooseWorker = !_chooseWorker;
                });
              }),
          const Flexible(
            child: const Text('انتخاب خدمت رسان برای من مهم است'),
          ),
        ],
      ),
    );
  }

  onSubmitTap() {
    print('carmodel + ${_addressCtrl.text}');
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

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => _chooseWorker
            ? const ChooseReliefWorkerPage()
            : const ChooseDayPage(),
      ),
    );

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
