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
                child: Image.asset(
                  'assets/images/emdad_khodro_logo_single.png',
                  width: MediaQuery.of(context).size.width * 0.80,
                )),
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
                      Text(
                          '\u2022 سلامت فنی خودرو، نقش اساسی در ایجاد حس اصمینان خاطر در زمان سفرهای برون و یا درون شهری برای مشتری دارد. لذا با ارائه خدمات بازدید فنی و پیش از سفر ما می توانیم این احساس امنیت خاطر را در شما ایجاد نماییم. یکی از سرویس های خدمات خودرو در محل شرکت امداد خودرو سایپا با نام " بازدید فنی و پیش از سفر " شامل بازدید از سیستم های اصلی خودرو به شرح ذیل می باشد: ',
                          textAlign: TextAlign.justify),
                      Text('الکتریکی (تسمه دینام ، باطری و ...)', textAlign: TextAlign.justify),
                      Text('سیستم موتور (شمعها ، روغن موتور و ...)', textAlign: TextAlign.justify),
                      Text('انتقال قدرت ( سطح روغن گیربکس ،ریگلاژ کلاچ و ...)', textAlign: TextAlign.justify),
                      Text('سیستم ترمز (لنت ها و ...)', textAlign: TextAlign.justify),
                      Text(' سیستم روشنایی چراغ ها', textAlign: TextAlign.justify),
                      Text('سیستم خنک کننده ( مایع خنک کننده)', textAlign: TextAlign.justify),
                      Text('سیستم برف پاکن', textAlign: TextAlign.justify),
                      Text('تنظیم باد لاستیک', textAlign: TextAlign.justify),
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
