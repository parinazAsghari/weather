import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'تماس با ما',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        // backgroundColor: secondary_dark_purple_color,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(
            height: 13,
          ),
          SizedBox(height: 15,),
          _customText("آدرس پستی دفتر مرکزی:"," تهران- کیلومتر 14 جاده مخصوص کرج(شهید لشگری) - روبروی سایپا دیزل- شماره 140"),
          _customText('پست الکترونیک :', 'info@emdadsaipa.ir'),
          _customText('امور مشتریان:', 'customer@emdadsaipa.ir'),
          _customText('خرید و یا تمدید اشتراک :', 'info@emdadsaipa.ir '),
          _customText('شماره نمابر :', '44180275'),
          _customText('کد پستی :', '1386164935'),
        ],
      ),
    );
  }
  Widget _customText(title,desc){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      width: MediaQuery.of(context).size.width*0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            maxLines: 3,
          ),
          Text(
            desc,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w100,),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),

        ],
      ),
    );
  }
}
