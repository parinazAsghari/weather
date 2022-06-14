import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FirstAndPeriodic extends StatefulWidget {
  const FirstAndPeriodic({Key? key}) : super(key: key);

  @override
  State<FirstAndPeriodic> createState() => _FirstAndPeriodicState();
}

class _FirstAndPeriodicState extends State<FirstAndPeriodic> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('سرویس های اولیه و دوره ای'),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\u2022 سرویس اولیه (فقط شامل بازدیدهای فنی): بازه زمانی انجام بازدیدها حداکثر پنج ماه از تاریخ شروع گارانتی است و حداقل پیمایش خودرو می بایست 1000 کیلومتر باشد؛ لذا گارانتی خودروهایی که در پنج ماه نخست،پیمایشی کمتر از 1000 کیلومتر داشته باشند باطل خواهد گردید  \n سرویس ثانویه (تعویض قطعات مصرفی): در بازه زمانی حداکثر شش ماه از تاریخ شروع گارانتی یا 4500 تا 5500 کیلومتر ( در خودروهای برلیانس حداکثر شش ماه یا 3500 تا 5000 کیلومتر) می بایست به انجام رسد. انجام هر دو بخش سرویس الزامی بوده و عدم انجام آنها باعث ابطال کامل گارانتی خودرو خواهد شد. خودروهای گروه رنو ( تندر90 ، ساندرو ، استپ وی، پارس تندر) و سراتو سرویس اولیه ندارند.',
                        textAlign: TextAlign.justify,
                      ),
                      Text('\u2022 زمان و کیلومتر انجام سرویس های ادواری: سرویس های ادواری کلیه خودروهای گروه سایپا می بایست مطابق استاندارد خودروساز انجام گردد.', textAlign: TextAlign.justify),
                      Text(
                          '\u2022 مواردی که مالک خودرو می بایست به صورت دوره ای در خودرو کنترل و بازدید کند: جدا از انجام سرویس های اولیه و ادواری توسط کارشناسان گروه سایپا، برخی موارد را هر مشتری محترم م بایست به صورت مستمر در خودرو خود کنترل و بازدید نماید که به شرح ذیل می باشند:',
                          textAlign: TextAlign.justify),
                      Text(' 1- کیفیت و سطح رونکارهای خودرو و عدم وجود نشتی از آنها (روغن موتور، روغن ترمز و ...).', textAlign: TextAlign.justify),
                      Text(' 2- کیفیت و سطح مایع خنک کننده رادیاتور و عدم نشتی آن.', textAlign: TextAlign.justify),
                      Text(' 3- سطح مایع شیشه شور و عملکرد تیغه های برف پاک کن.', textAlign: TextAlign.justify),
                      Text(' 4- فشار باد و سلامت تایرها و سفت بودن پیچ و مهره چرخ ها.', textAlign: TextAlign.justify),
                      Text(' 5- کیفیت و وضعیت ظاهری تسمه ها (تسمه دینام و ...).', textAlign: TextAlign.justify),
                      Text(' 6- چراغها و لامپها (چراغ های جلو خودرو ، مه شکن ها ، چراغ های ترمز ، راهنما ، دنده عقب و ...).', textAlign: TextAlign.justify),
                      Text(' 7- عملکرد بخاری.', textAlign: TextAlign.justify),
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
