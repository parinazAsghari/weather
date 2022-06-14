import 'package:flutter/material.dart';

class TripEmdad extends StatefulWidget {
  const TripEmdad({Key? key}) : super(key: key);

  @override
  State<TripEmdad> createState() => _TripEmdadState();
}

class _TripEmdadState extends State<TripEmdad> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('امداد سفر'),
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
                    children: [
                      Text('\u2022 با خرید این اشتراک میتوانید دو خودروی سواری را تحت پوشش خدمات امدادی ذیل قرار دهید.', textAlign: TextAlign.justify),
                      Text('\u2022 اگر خودرو شما بر اثر تصادف و یا حادثه ای مشابه متوقف گردد، به صورت رایگان به نزدیکترین نمایندگی مجاز مرتبط با آن خودرو یا نزدیکترین پارکینگ منتقل خواهد گردید (مشمول کلیه خودروهای سواری).',
                          textAlign: TextAlign.justify),
                      Text('\u2022 اگر خودرو شما به دلیل نقص فنی متوقف گردد، به صورت رایگان به نزدیکترین نمایندگی مجاز مرتبط با آن خودرو یا پارکینگ منتقل خواهد گردید (مشمول کلیه خودروهای سواری).', textAlign: TextAlign.justify),
                      Text('\u2022 تعمیر و راه اندازی خودروی شما در صورت امکان، با اجرت رایگان و فقط دریافت هزینه قطعه صورت می پذیرد. (مشمول خودروهای گروه خودروسازی سایپا).', textAlign: TextAlign.justify),
                      Text('\u2022 تعویض لاستیک پنچر در صورت وجود زاپاس سالم به صورت رایگان ( مشمول کلیه خودروهای سواری).', textAlign: TextAlign.justify),
                      Text('\u2022 رفع پنچری در محل در صورت امکان. ( مشمول کلیه خودروهای سواری).', textAlign: TextAlign.justify),
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
