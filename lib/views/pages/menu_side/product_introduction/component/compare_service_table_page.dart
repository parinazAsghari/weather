import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../constants.dart';
import '../../../../widgets/custom_neomorphic_box.dart';
import '../widget/description_box.dart';

class CompareServicePage extends StatefulWidget {
  const CompareServicePage({Key? key}) : super(key: key);

  @override
  State<CompareServicePage> createState() => _CompareServicePageState();
}

class _CompareServicePageState extends State<CompareServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('جدول مقایسه ای خدمات'),
        ),
        body: _body());
  }

  Widget _body() {
    return Stack(
      children: [
        Center(
          child: Opacity(
              opacity: 0.4,
              child: Image.asset(
                'assets/images/emdad_khodro_logo_single.png',
                width: MediaQuery.of(context).size.width * 0.80,
              )),
        ),
        Container(
          child: GridView.extent(
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
                height: 60 / 640,
                isChildText: false,
                isFull: false,
                onTap: () async {
                  if (!await launchUrl(Uri.parse('http://emdadsaipa.ir/compare-garantibadane'))) throw 'Could not launch';
                },
                widget: _subItemWidget('assets/images/ic_news_light.png', 'خدمات گارانتی بدنه'),
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
                height: 60 / 640,
                isChildText: false,
                isFull: false,
                onTap: () async {
                  if (!await launchUrl(Uri.parse('http://emdadsaipa.ir/compare-KhadamatEmdadi'))) throw 'Could not launch';
                },
                widget: _subItemWidget('assets/images/ic_news_light.png', 'خدمات امدادی'),
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
                height: 60 / 640,
                isChildText: false,
                isFull: false,
                onTap: () async {
                  if (!await launchUrl(Uri.parse('http://emdadsaipa.ir/compare-Khadamatdarmahal'))) throw 'Could not launch';
                },
                widget: _subItemWidget('assets/images/ic_news_light.png', 'خدمات در محل'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _subItemWidget(String imagePath, String title) {
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
          child: FittedBox(fit: BoxFit.fitWidth, child: Text(title, textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Vazir', fontWeight: FontWeight.bold, fontSize: 14))),
        ),
      ],
    );
  }
}
