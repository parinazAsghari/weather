import 'package:flutter/material.dart';

class SupplmentaryEmdad extends StatefulWidget {
  const SupplmentaryEmdad({Key? key}) : super(key: key);

  @override
  State<SupplmentaryEmdad> createState() => _SupplmentaryEmdadState();
}

class _SupplmentaryEmdadState extends State<SupplmentaryEmdad> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('امداد تکمیلی'),
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
                    children: [
                      Text('\u2022 اگر خودرو شما به دلیل نقص فنی یا غیر فنی ( تصادف ) متوقف گردد، به صورت رایگان به نزدیکترین نمایندگی مجاز سایپا یا پارکینگ حمل خواهد شد.'),
                      Text('\u2022 در صورت توقف خودروی شما به دلیل نقص فنی، امدادگر در محل حضور یافته و پس از بررسی های لازم خودرو شما راه اندازی خواهد شد  که در صورت رفع نقص اجرت انجام کار به صورت رایگان و هزینه تعویض قطعه مطابق با ضوابط گارانتی خواهد بود ولی در صورت عدم امکان راه اندازی در محل، خودرو به نزدیکترین نمایندگی مجاز سایپا به صورت رایگان حمل خواهد شد.'),
                      Text('\u2022 از دیگر مزایای این خدمت : تعویض لاستیک پنچر در صورت وجود زاپاس سالم به صورت رایگان می باشد. تمامی اشتراکها از ساعت 24 تاریخ خرید به مدت یکسال (365 روز) فعال می گردد.'),

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
