import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckBeforeTrip extends StatefulWidget {
  const CheckBeforeTrip({Key? key}) : super(key: key);

  @override
  State<CheckBeforeTrip> createState() => _CheckBeforeTripState();
}

class _CheckBeforeTripState extends State<CheckBeforeTrip> {



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('بازدید فنی پیش از سفر'),
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


                      Text('\u2022 سلامت فنی خودرو، نقش اساسی در ایجاد حس اصمینان خاطر در زمان سفرهای برون و یا درون شهری برای مشتری دارد. لذا با ارائه خدمات بازدید فنی و پیش از سفر ما می توانیم این احساس امنیت خاطر را در شما ایجاد نماییم. یکی از سرویس های خدمات خودرو در محل شرکت امداد خودرو سایپا با نام " بازدید فنی و پیش از سفر " شامل بازدید از سیستم های اصلی خودرو به شرح ذیل می باشد: '),

                      Text('الکتریکی (تسمه دینام ، باطری و ...)'),
                      Text('سیستم موتور (شمعها ، روغن موتور و ...)'),
                      Text('انتقال قدرت ( سطح روغن گیربکس ،ریگلاژ کلاچ و ...)'),
                      Text('سیستم ترمز (لنت ها و ...)'),
                      Text(' سیستم روشنایی چراغ ها'),
                      Text('سیستم خنک کننده ( مایع خنک کننده)'),
                      Text('سیستم برف پاکن'),
                      Text('تنظیم باد لاستیک'),
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
