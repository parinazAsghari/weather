import 'package:flutter/material.dart';

class NecessaryEmdad extends StatefulWidget {
  const NecessaryEmdad({Key? key}) : super(key: key);

  @override
  State<NecessaryEmdad> createState() => _NecessaryEmdadState();
}

class _NecessaryEmdadState extends State<NecessaryEmdad> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('امداد ضروری'),
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
                      Text('\u2022 خدمات الزامی به خدماتی اطلاق می گردد که خودروساز در ازای خرید خودرو نو به صورت رایگان به دارندگان گروه خودرو سازی سایپا اهداء می نماید.', textAlign: TextAlign.justify),
                      Text('\u2022 اگر خودرو شما به دلیل نقص فنی دچار توقف گردد، به صورت رایگان به نزدیکترین نمایندگی مجاز سایپا حمل خواهد شد.', textAlign: TextAlign.justify),
                      Text(
                          '\u2022 در صورت توقف خودروی شما به دلیل نقص فنی، امدادگر در محل حضور یافته و پس از بررسی های لازم، خودرو شما راه اندازی خواهد شد که در صورت رفع نقص، اجرت انجام کار به صورت رایگان و هزینه تعویض قطعه مطابق با ضوابط گارانتی خواهد بود. ولی در صورت عدم امکان راه اندازی در محل، خودرو به نزدیکترین نمایندگی مجاز سایپا به صورت رایگان حمل خواهد شد.',
                          textAlign: TextAlign.justify),
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
