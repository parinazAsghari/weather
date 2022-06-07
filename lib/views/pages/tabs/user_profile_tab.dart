import 'package:emdad_khodro_saipa/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/DialogWidgets.dart';
import 'home_tab/services/emdad_in_place/widget/custom_submit_button.dart';
import 'home_tab/services/emdad_in_place/widget/custom_text_field.dart';

class UserProfileTab extends StatefulWidget {
  const UserProfileTab({Key? key}) : super(key: key);

  @override
  State<UserProfileTab> createState() => _UserProfileTabState();
}

class _UserProfileTabState extends State<UserProfileTab> {
  TextEditingController _userFullNameController = TextEditingController();
  TextEditingController _userNationalCodeController = TextEditingController();
  TextEditingController _userPhoneController = TextEditingController();

  getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _userFullNameController.text =
        preferences.getString('user_full_name') ?? '';
    _userNationalCodeController.text =
        preferences.getString('user_national_code') ?? '';
    _userPhoneController.text =
        preferences.getString('user_phone_number') ?? '';
  }

  onSaveButtonTap() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('user_full_name', _userFullNameController.text);
    preferences.setString(
        'user_national_code', _userNationalCodeController.text);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return MessageDialogWidget(
            body: 'اطلاعات با موفقیت ذخیره شد',
            dismissable: true,
            positiveTxt: 'باشه',
            positiveFunc: () async {},
          );
        });
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: defaultPadding,
              ),
              CustomTextField(
                title: 'نام و نام خانوادگی',
                height: 35,
                controller: _userFullNameController,
                marginRight: 20,
                marginLeft: 20,
                hintText: 'کاربر مهمان',
                iconData: Icons.person,
              ),
              CustomTextField(
                title: 'کد ملی',
                height: 35,
                controller: _userNationalCodeController,
                marginRight: 20,
                marginLeft: 20,
                marginTop: 15,
                hintText: '0021111111',
                iconData: Icons.person,
              ),
              CustomTextField(
                title: 'شماره موبایل',
                height: 35,
                controller: _userPhoneController,
                marginRight: 20,
                marginLeft: 20,
                marginTop: 15,
                hintText: '09121111111',
                iconData: Icons.phone,
                enabled: false,
              ),
              CustomSubmitButton(
                  onTap: onSaveButtonTap,
                  text: 'ثبت',
                  marginRight: 20,
                  marginLeft: 20,
                  marginTop: 15),
            ],
          ),
        ),
      ),
    );
  }
}
