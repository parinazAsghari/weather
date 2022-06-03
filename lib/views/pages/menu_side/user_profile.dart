
import 'package:emdad_khodro_saipa/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/DialogWidgets.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {


  TextEditingController _userFullNameController = TextEditingController();
  TextEditingController _userNationalCodeController = TextEditingController();
  TextEditingController _userPhoneController = TextEditingController();

  getUserData()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _userFullNameController.text = preferences.getString('user_full_name')??'';
    _userNationalCodeController.text = preferences.getString('user_national_code')??'';
    _userPhoneController.text = preferences.getString('user_phone_number')??'';

    setState(() {

    });

  }

  onSaveButtonTap() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('user_full_name', _userFullNameController.text);
    preferences.setString('user_national_code', _userNationalCodeController.text);


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
      // backgroundColor: dark_theme_primary,
      appBar: AppBar(
        elevation: 0,
        // automaticallyImplyLeading: true,
        // backgroundColor: secondary_dark_purple_color,

        title: Text('پروفایل کاربری', style: TextStyle(color: Colors.white),),

      ),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,

        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: defaultPadding,),

              Container(
                  child: Image.asset(
                    'assets/images/ic_guestuser.png',
                    color: dark_theme_primary,
                    fit: BoxFit.cover,
                    height: 200,
                    width: 200,
                  )),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20, top: 10),
                  child: Text('نام و نام خانوادگی',),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20, left: 20, top: 10),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: TextField(
                    controller: _userFullNameController,

                    keyboardType: TextInputType.name,
                    maxLength: 11,
                    obscureText: false,
                    style: TextStyle(fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.person,
                      ),
                      // fillColor: secondary_light_grey_color,

                      // isDense: true,filled: true,
                      hintText: 'کاربر مهمان',

                      counterText: '',
                      // fillColor: Colors.white,
                      contentPadding: EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 10),
                      // labelText: 'شماره همراه',labelStyle: TextStyle(),
                      floatingLabelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              color: color_sharp_orange_light)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            // color: primary_grey_color,
                              width: 0.8)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            // color: primary_grey_color,
                              width: 0.8)),
                      // disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)),borderSide: BorderSide(color: Colors.grey,width: 0.8))
                    ),
                  ),
                ),
                // child: TextField(
                //   obscureText: true,
                //   decoration: InputDecoration(
                //     suffixIcon: const Icon(
                //       Icons.person,
                //       color: Colors.green,
                //     ),
                //
                //     floatingLabelBehavior: FloatingLabelBehavior.never,
                //     border: OutlineInputBorder(),
                //     labelText: 'شماره تماس',
                //   ),
                // ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20, top: 10),
                  child: Text('کد ملی'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20, left: 20, top: 10),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: TextField(
                    controller: _userNationalCodeController,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    obscureText: false,
                    style: TextStyle(fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.person,
                      ),
                      // fillColor: secondary_light_grey_color,

                      // isDense: true,filled: true,
                      hintText: '1234567890',
                      counterText: '',
                      // fillColor: Colors.white,
                      contentPadding: EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 10),
                      // labelText: 'شماره همراه',labelStyle: TextStyle(),
                      floatingLabelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              color: color_sharp_orange_light)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            // color: primary_grey_color,
                              width: 0.8)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            // color: primary_grey_color,
                              width: 0.8)),
                      // disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)),borderSide: BorderSide(color: Colors.grey,width: 0.8))
                    ),
                  ),
                ),
                // child: TextField(
                //   obscureText: true,
                //   decoration: InputDecoration(
                //     suffixIcon: const Icon(
                //       Icons.person,
                //       color: Colors.green,
                //     ),
                //
                //     floatingLabelBehavior: FloatingLabelBehavior.never,
                //     border: OutlineInputBorder(),
                //     labelText: 'شماره تماس',
                //   ),
                // ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20, top: 10),
                  child: Text('شماره موبایل'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20, left: 20, top: 10),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: TextField(
                    controller: _userPhoneController,
                    keyboardType: TextInputType.phone,
                    maxLength: 11,
                    enabled: false,
                    obscureText: false,
                    style: TextStyle(fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.phone,
                      ),
                      // fillColor: secondary_light_grey_color,

                      // isDense: true,filled: true,
                      hintText: 'شماره موبایل',
                      counterText: '',
                      // fillColor: Colors.white,
                      contentPadding: EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 10),
                      // labelText: 'شماره همراه',labelStyle: TextStyle(),
                      floatingLabelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              color: color_sharp_orange_light)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            // color: primary_grey_color,
                              width: 0.8)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            // color: primary_grey_color,
                              width: 0.8)),
                      // disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)),borderSide: BorderSide(color: Colors.grey,width: 0.8))
                    ),
                  ),
                ),
                // child: TextField(
                //   obscureText: true,
                //   decoration: InputDecoration(
                //     suffixIcon: const Icon(
                //       Icons.person,
                //       color: Colors.green,
                //     ),
                //
                //     floatingLabelBehavior: FloatingLabelBehavior.never,
                //     border: OutlineInputBorder(),
                //     labelText: 'شماره تماس',
                //   ),
                // ),
              ),


              //button
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.55,
                      margin: EdgeInsets.all(defaultPadding),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          backgroundColor:
                          MaterialStateProperty.all(dark_theme_secondary),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'ثبت',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        onPressed: () {
                          onSaveButtonTap();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),


        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //
        //   children: [
        //     Image.asset('assets/images/mobile_app_dev.png', height: 150, width: 150,fit: BoxFit.cover,),
        //
        //     // SizedBox(
        //     //   height: defaultPadding,
        //     // ),
        //
        //     Text('در حال توسعه ...' ,style: TextStyle(fontSize: 20),),
        //
        //     SizedBox(height: defaultPadding,),
        //
        //     Text('لطفا نسخه اپلیکیشن را بروز رسانی نمائید')
        //
        //
        //
        //
        //
        //
        //   ],
        // ),
      ),
    );
  }
}
