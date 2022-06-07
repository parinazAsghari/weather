import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../widget/description_box.dart';

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
          title: const Text('گارانتی بدنه'),
          titleTextStyle: const TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "پایه",
              ),
              Tab(
                text: "اکونومی",
              ),
              const Tab(
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
        const SizedBox(
          height: 10,
        ),
        DescriptionBox(
          title: 'گارانتی $text',
          desc:
              "گارانتی بدنه سایپا یکی از سرویس های جذاب کارت طلایی می باشد، که مالکان خودروهای سواری گروه سایپا می توانند با خرید آن اتومبیل خود را در صورت آسیب دیدن بر اثر حوادث و یا سرقت های احتمالی تحت پوشش گارانتی بدنه قرار دهند. به عبارت دیگر، دارندگان خودروهای گروه سایپا می توانند با خرید گارانتی بدنه سایپا کارت طلایی سرمایه ارزشمند خود را در مقابل کلیه سوانح رانندگی و حوادث غیر مترقبه تا مدت 365 روز تضمین کنند. گارانتی بدنه پایه ، اولین سطح محصول گارانتی بدنه در شرکت امداد خودرو سایپا می باشد که با داشتن پوشش های پایه و قیمت مناسب به دارندگان خودرو گروه خودرو سازی سایپا قابل ارائه می باشد. ",
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
