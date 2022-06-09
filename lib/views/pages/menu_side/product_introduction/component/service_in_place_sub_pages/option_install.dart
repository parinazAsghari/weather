import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OptionInstall extends StatefulWidget {
  const OptionInstall({Key? key}) : super(key: key);

  @override
  State<OptionInstall> createState() => _OptionInstallState();
}

class _OptionInstallState extends State<OptionInstall> {



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('نصب آپشن'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,

      child: Stack(
        children: [
          Center(
            child: Opacity(
                opacity: 0.4,
                child: Image.asset('assets/images/emdad_khodro_logo_single.png', width: MediaQuery.of(context).size.width*0.80, )),
          ),
          SingleChildScrollView(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text('\u2022 استفاده از قطعات آپشن در خودرو علاوه بر رفع برخی از نیازهای مشتریان، می تواند تاثیر بسزایی در افزایش ایمنی خودرو یا رفاهی افراد داشته باشد. لذا با توجه به اهمیت موضوع، شرکت امداد خودرو سایپا با ارائه خدمات ذیل در راستای اهداف مذکور گام برداشته است خدماتی نظیر:'),

                      Text('دزدگیر'),
                      Text('سنسور دنده عقب'),
                      Text('مولتی مدیا'),
                      Text('مانیتور'),
                      Text('پاور ویندوز'),
                      Text('نمدی درب موتور'),
                      Text('سیستم صوتی و تصویری'),

                      Text(''),


                      Text('\u2022 مزایای استفاده از خدمات آپشن:'),

                      Text('استفاده از قطعات استاندارد'),
                      Text('نصب و راه اندازی با رعایت ضوابط گارانتی'),
                      Text('استفاده از افراد مجرب جهت ارائه خدمت'),



                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
