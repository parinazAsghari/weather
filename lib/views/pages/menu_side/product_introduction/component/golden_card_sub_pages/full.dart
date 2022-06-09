import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Full extends StatefulWidget {
  const Full({Key? key}) : super(key: key);

  @override
  State<Full> createState() => _FullState();
}

class _FullState extends State<Full> {

  void _onMoreInfoTap()async{
    if (!await launchUrl(Uri.parse('https://emdadsaipa.ir/garanti-kamel'))) throw 'Could not launch';
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('گارانتی بدنه کامل'),
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
                child: Image.asset('assets/images/emdad_khodro_logo_single.png', width: MediaQuery.of(context).size.width*0.80, )),
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
                      Text(' گارانتی بدنه کامل ، سطح کامل گارانتی بدنه در شرکت امداد خودرو سایپا می باشد که با ارائه پوشش های کامل بیمه ای به دارندگان خودرو سواری گروه خودروسازی سایپا از سرمایه خودرویی آنها در مقابل کلیه حوادث و یا سوانح غیر مترقبه محافظت می کند. یکی از مهمترین پوشش های محصول گارانتی بدنه کامل ، پوشش عدم محدودیت دفعات استفاده از جبران خسارت می باشد که این محصول را از سایر سطوح متمایز می کند.'),

                      TextButton(
                          style: TextButton.styleFrom(
                              primary: Theme.of(context).primaryColor
                          ),
                          onPressed: (){
                            _onMoreInfoTap();
                          },
                          child: Text('اطلاعات بیشتر')
                      )
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
