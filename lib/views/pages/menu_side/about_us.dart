import 'package:emdad_khodro_saipa/views/pages/DevelopingPage.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          'درباره ما',
          // style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        // backgroundColor: secondary_dark_purple_color,
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
                      Text('شرکت امداد خودرو سایپا (سهامی خاص) بعنوان حلقه تکمیلی در شبکه خدمات پس از فروش گروه خودرو سازی سایپا، با هدف پاسخ به نیاز امدادرسانی خودروهای گروه سایپا در سطح جامعه در سال 1381 شكل گرفت.',
                          textAlign: TextAlign.justify),
                      Text(
                          'این شركت، با انجام مطالعات كارشناسی دقیق به بررسی كامل و همه جانبه موضوعات مرتبط با امداد رسانی پرداخته و الگوهای موفق امداد در سطح جهان همچون ADAC و GREEN FLAG و ... را مطالعه نموده و پس از آن وارد فاز برنامه ریزی، تدارك و اجرا شد تا جایی كه موفق گردید توسط نمایندگی ها و عاملیت های مجاز خود، به خودروهای گروه خودرو سازی سایپا و سایر خودروهای سواری خدمات خودرویی ارائه دهد.',
                          textAlign: TextAlign.justify),
                      Text('کسب و کارها: ', textAlign: TextAlign.justify),
                      Text('•	خدمات امدادی', textAlign: TextAlign.justify),
                      Text('•	خدمات خودرو در محل', textAlign: TextAlign.justify),
                      Text('•	خدمات گارانتی بدنه', textAlign: TextAlign.justify),
                      Text('ماموریت: ', textAlign: TextAlign.justify),
                      Text('طراحی ، فروش و ارائه خدمات به دارندگان خودرو از طریق شبكه های خدماتی', textAlign: TextAlign.justify),
                      Text('چشم انداز: ', textAlign: TextAlign.justify),
                      Text('پیشتاز در ارائه خدمات نوآورانه و با ارزش به مشتریان', textAlign: TextAlign.justify),
                    ],
                  ),
                ),

                // SizedBox(
                //   height: defaultPadding,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


