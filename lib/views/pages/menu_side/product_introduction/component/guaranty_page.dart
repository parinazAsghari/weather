import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class GuarantyPage extends StatefulWidget {
  const GuarantyPage({Key? key}) : super(key: key);

  @override
  State<GuarantyPage> createState() => _GuarantyPageState();
}

class _GuarantyPageState extends State<GuarantyPage> {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('گارانتی بدنه'),
          titleTextStyle: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "پایه",
              ),
              Tab(
                text: "اکونومی",
              ),
              Tab(
                text: "کامل",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _body('پایه'),
            _body('اکونومی'),
            _body('کامل'),
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
        _descBox('گارانتی $text',
            "گارانتی بدنه سایپا یکی از سرویس های جذاب کارت طلایی می باشد، که مالکان خودروهای سواری گروه سایپا می توانند با خرید آن اتومبیل خود را در صورت آسیب دیدن بر اثر حوادث و یا سرقت های احتمالی تحت پوشش گارانتی بدنه قرار دهند. به عبارت دیگر، دارندگان خودروهای گروه سایپا می توانند با خرید گارانتی بدنه سایپا کارت طلایی سرمایه ارزشمند خود را در مقابل کلیه سوانح رانندگی و حوادث غیر مترقبه تا مدت 365 روز تضمین کنند. گارانتی بدنه پایه ، اولین سطح محصول گارانتی بدنه در شرکت امداد خودرو سایپا می باشد که با داشتن پوشش های پایه و قیمت مناسب به دارندگان خودرو گروه خودرو سازی سایپا قابل ارائه می باشد. "),
        SizedBox(
          height: 10,
        ),

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
