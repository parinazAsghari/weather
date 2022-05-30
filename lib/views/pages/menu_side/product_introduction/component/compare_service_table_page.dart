import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class CompareServicePage extends StatefulWidget {
  const CompareServicePage({Key? key}) : super(key: key);

  @override
  State<CompareServicePage> createState() => _CompareServicePageState();
}

class _CompareServicePageState extends State<CompareServicePage> {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('جدول مقایسه ای خدمات'),
          titleTextStyle: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text("گارانتی بدنه",textAlign: TextAlign.center,),
              ),
              Tab(
                child: Text("امدادی",textAlign: TextAlign.center,),
              ),
              Tab(
                child: Text('خودرو در محل',textAlign: TextAlign.center,),
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
        SizedBox(
          height: 10,
        ),
        _descBox(text,
            "خدمات الزامی به خدماتی اطلاق می گردد که خودروساز در ازای خرید خودرو نو به صورت رایگان به دارندگان گروه خودرو سازی سایپا اهداء می نماید."),
        SizedBox(
          height: 10,
        ),
        _descBox('خودرو تحت پوشش :',
            "*​کلیه خودروهای سواری و تجاری سبک گروه خودرو سازی سایپا "),
        SizedBox(
          height: 10,
        ),
        _descBox('روش خرید :',
            ' ​​این خدمت در هنگام خرید خودرو به صورت " رایگان " توسط خودروساز به شما اهدا می گردد .'),
        SizedBox(
          height: 10,
        ),
        _descBox('نحوه پرداخت :', 'رایگان برای خودروهای صفر'),
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
