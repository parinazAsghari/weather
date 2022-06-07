import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../widget/description_box.dart';

class CompareServicePage extends StatefulWidget {
  const CompareServicePage({Key? key}) : super(key: key);

  @override
  State<CompareServicePage> createState() => _CompareServicePageState();
}

class _CompareServicePageState extends State<CompareServicePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('جدول مقایسه ای خدمات'),
          titleTextStyle: const TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  "گارانتی بدنه",
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(
                child: Text(
                  "امدادی",
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(
                child: Text(
                  'خودرو در محل',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _body('جدول مقایسه ای خدمات گارانتی بدنه'),
            _body('جدول مقایسه ای خدمات امدادی'),
            _body('جدول مقایسه ای خدمات خودرو در محل'),
          ],
        ),
      ),
    );
  }

  Widget _body(text) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        DescriptionBox(
            title:text,
            desc: "خدمات الزامی به خدماتی اطلاق می گردد که خودروساز در ازای خرید خودرو نو به صورت رایگان به دارندگان گروه خودرو سازی سایپا اهداء می نماید.",
        ),
        const SizedBox(
          height: 10,
        ),
        DescriptionBox(
          title: 'خودرو تحت پوشش :',
          desc: "*​کلیه خودروهای سواری و تجاری سبک گروه خودرو سازی سایپا ",
        ),
        const SizedBox(
          height: 10,
        ),
        DescriptionBox(
          title: 'روش خرید :',
          desc: ' ​​این خدمت در هنگام خرید خودرو به صورت " رایگان " توسط خودروساز به شما اهدا می گردد .',
        ),
        const SizedBox(
          height: 10,
        ),
        DescriptionBox(
          title: 'نحوه پرداخت :',
          desc: 'رایگان برای خودروهای صفر',
        ),
      ],
    );
  }
}
