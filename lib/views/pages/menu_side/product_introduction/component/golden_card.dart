import 'package:emdad_khodro_saipa/views/pages/menu_side/product_introduction/component/golden_card_sub_pages/basic.dart';
import 'package:emdad_khodro_saipa/views/pages/menu_side/product_introduction/component/golden_card_sub_pages/economy.dart';
import 'package:emdad_khodro_saipa/views/pages/menu_side/product_introduction/component/golden_card_sub_pages/full.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../widgets/custom_neomorphic_box.dart';
import '../widget/description_box.dart';

class GoldenCard extends StatefulWidget {
  const GoldenCard({Key? key}) : super(key: key);

  @override
  State<GoldenCard> createState() => _GoldenCardState();
}

class _GoldenCardState extends State<GoldenCard> {
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('کارت طلایی'),
      ),
        body: _body()
    );
  }

  Widget _body() {
    return Stack(
      children: [
        Center(
          child: Opacity(
              opacity: 0.4,
              child: Image.asset('assets/images/emdad_khodro_logo_single.png', width: MediaQuery.of(context).size.width*0.80, )),
        ),
        Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
                child: Text(' گارانتی بدنه سایپا یکی از سرویس های جذاب کارت طلایی می باشدکه مالکان خودروهای سواری گروه سایپا می توانند با خرید آن اتومبیل خود را در صورت آسیب دیدن بر اثر حوادث و یا سرقت های احتمالی تحت پوشش گارانتی بدنه قرار دهند. به عبارت دیگر، دارندگان خودروهای گروه سایپا می توانند با خرید گارانتی بدنه سایپا (کارت طلایی ) سرمایه ارزشمند خود را در مقابل کلیه سوانح رانندگی و حوادث غیر مترقبه تا مدت 365 روز تضمین کنند.'),
              ),
              GridView.extent(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                maxCrossAxisExtent: 120,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                padding: EdgeInsets.all(defaultPadding),
                children: [
                  CustomNeomorphicBox(
                    title: '',
                    index: 0,
                    marginRight: 0,
                    marginBottom: 0,
                    marginTop: 0,
                    marginLeft: 0,
                    paddingTop: 8,
                    paddingRight: 8,
                    paddingLeft: 8,
                    selectedIndex: 1,
                    height: 60/640,
                    isChildText: false,
                    isFull: false,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Basic()));
                    },
                    widget: _subItemWidget('assets/images/ic_news.png', 'گارانتی بدنه پایه'),
                  ),

                  CustomNeomorphicBox(
                    title: '',
                    index: 0,
                    marginRight: 0,
                    marginBottom: 0,
                    marginTop: 0,
                    marginLeft: 0,
                    paddingTop: 8,
                    paddingRight: 8,
                    paddingLeft: 8,
                    selectedIndex: 1,
                    height: 60/640,
                    isChildText: false,
                    isFull: false,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Economy()));
                    },
                    widget: _subItemWidget('assets/images/ic_news.png', 'گارانتی بدنه اکونومی'),
                  ),

                  CustomNeomorphicBox(
                    title: '',
                    index: 0,
                    marginRight: 0,
                    marginBottom: 0,
                    marginTop: 0,
                    marginLeft: 0,
                    paddingTop: 8,
                    paddingRight: 8,
                    paddingLeft: 8,
                    selectedIndex: 1,
                    height: 60/640,
                    isChildText: false,
                    isFull: false,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Full()));
                    },
                    widget: _subItemWidget('assets/images/ic_news.png', 'گارانتی بدنه کامل'),
                  ),


                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
  Widget _subItemWidget(String imagePath,  String title){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Container(

              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            )),

        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(title,textAlign: TextAlign.center, style: TextStyle( fontFamily: 'Vazir',fontWeight: FontWeight.bold, fontSize: 14))),
        ),
      ],
    );
  }


}
