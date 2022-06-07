import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../widget/description_box.dart';

class RelayPage extends StatefulWidget {
  const RelayPage({Key? key}) : super(key: key);

  @override
  State<RelayPage> createState() => _RelayPageState();
}

class _RelayPageState extends State<RelayPage> {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('امدادی'),
          titleTextStyle: const TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "تکمیلی (247)",
              ),
              Tab(
                text: "الزامی",
              ),
              Tab(
                text: "عمومی",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _body('تکمیلی'),
            _body('الزامی'),
            _body('عمومی'),
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
          title: 'امداد $text',
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
