import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Basic extends StatefulWidget {
  const Basic({Key? key}) : super(key: key);

  @override
  State<Basic> createState() => _BasicState();
}

class _BasicState extends State<Basic> {


  void _onMoreInfoTap()async{
    if (!await launchUrl(Uri.parse('https://emdadsaipa.ir/garanti-payeh'))) throw 'Could not launch';
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('گارانتی بدنه پایه'),
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
                      Text('گارانتی بدنه پایه ، اولین سطح محصول گارانتی بدنه در شرکت امداد خودرو سایپا می باشد که با داشتن پوشش های پایه و قیمت مناسب به دارندگان خودرو گروه خودرو سازی سایپا قابل ارائه می باشد.'),

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
