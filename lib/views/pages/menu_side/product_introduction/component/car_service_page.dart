import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../widget/description_box.dart';

class CarServicePage extends StatefulWidget {
  const CarServicePage({Key? key}) : super(key: key);

  @override
  State<CarServicePage> createState() => _CarServicePageState();
}

class _CarServicePageState extends State<CarServicePage> {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('خدمات خودرو در محل'),
          titleTextStyle: const TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  "سرویس های اولیه و ادواری",
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(
                child: Text(
                  "آپشن و لوازم جانبی",
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(
                child: Text(
                  'بازدید فنی و پیش از سفر',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _body('خدمات ادواری'),
            _body('خدمات نصب آپشن'),
            _body('بازدید فنی و پیش از سفر'),
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
          desc:"مشتری محترم خدمات خودرو در محل، با سلام؛ این راهنمای کوتاه به منظور آگاهی هر چه بیشتر شما در خصوص سرویس و نگهداری خودرو تهیه شده است؛ امیدواریم مطالعه این راهنما شما را در استفاده و نگهداری هر چه بهتر خودرو یاری نماید.",
        ),
        const SizedBox(
          height: 10,
        ),
        DescriptionBox(
          title:'خودرو تحت پوشش :',
          desc:"*​کلیه خودروهای سواری و تجاری سبک گروه خودرو سازی سایپا ",
        ),
        const SizedBox(
          height: 10,
        ),
        DescriptionBox(
          title: 'روشهای رزرو:',
          desc: 'خرید آنلاین از پرتال شرکت امداد خودرو سایپا کلیک کنید.',
        ),
        const SizedBox(
          height: 10,
        ),
        DescriptionBox(
          title: 'نحوه پرداخت :',
          desc: 'نقدی (پرداخت در محل )',
        ),
      ],
    );
  }
}
