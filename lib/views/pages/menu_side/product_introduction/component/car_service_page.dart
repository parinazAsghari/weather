import 'package:flutter/material.dart';

import '../../../../../constants.dart';

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
          title: Text('خدمات خودرو در محل'),
          titleTextStyle: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text("سرویس های اولیه و ادواری",textAlign: TextAlign.center,),
              ),
              Tab(
                child: Text("آپشن و لوازم جانبی",textAlign: TextAlign.center,),
              ),
              Tab(
                child: Text('بازدید فنی و پیش از سفر',textAlign: TextAlign.center,),
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
        SizedBox(
          height: 10,
        ),
        _descBox(text,
            "مشتری محترم خدمات خودرو در محل، با سلام؛ این راهنمای کوتاه به منظور آگاهی هر چه بیشتر شما در خصوص سرویس و نگهداری خودرو تهیه شده است؛ امیدواریم مطالعه این راهنما شما را در استفاده و نگهداری هر چه بهتر خودرو یاری نماید."),
        SizedBox(
          height: 10,
        ),
        _descBox('خودرو تحت پوشش :',
            "*​کلیه خودروهای سواری و تجاری سبک گروه خودرو سازی سایپا "),
        SizedBox(
          height: 10,
        ),
        _descBox('روشهای رزرو:',
            'خرید آنلاین از پرتال شرکت امداد خودرو سایپا کلیک کنید.'),
        SizedBox(
          height: 10,
        ),
        _descBox('نحوه پرداخت :', 'نقدی (پرداخت در محل )'),
      ],
    );
  }

  Widget _descBox(title, desc) {
    return Container(
      padding: EdgeInsets.only(top: 10, right: 15, bottom: 10),
      width: MediaQuery.of(context).size.width * 0.8,
      // height: MediaQuery.of(context).size.height*0.17,
      decoration: BoxDecoration(
        border: Border.all(color: dark_theme_secondary, width: 1.0),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            desc,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
