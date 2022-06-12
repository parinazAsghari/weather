import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Economy extends StatefulWidget {
  const Economy({Key? key}) : super(key: key);

  @override
  State<Economy> createState() => _EconomyState();
}

class _EconomyState extends State<Economy> {
  void _onMoreInfoTap() async {
    if (!await launchUrl(Uri.parse('https://emdadsaipa.ir/garanti-economi'))) throw 'Could not launch';
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('گارانتی بدنه اکونومی (اقتصادی)'),
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
                      Text(
                          'گارانتی بدنه اکونومی ، یکی از سطوح گارانتی بدنه شرکت امداد خودرو سایپا می باشد که با در نظر گرفتن شرایط اقتصادی و اهمیت دادن به حق انتخاب مشتریان گروه خودرو سازی سایپا طراحی گردیده است. محصول گارانتی بدنه اکونومی دارای خدماتی مشابه گارانتی بدنه پایه ولی با پوشش های کامل تر از گارانتی بدنه پایه می باشد.'),
                      TextButton(
                          style: TextButton.styleFrom(primary: Theme.of(context).primaryColor),
                          onPressed: () {
                            _onMoreInfoTap();
                          },
                          child: Text('اطلاعات بیشتر'))
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
