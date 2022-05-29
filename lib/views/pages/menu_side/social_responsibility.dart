


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialResponsibility extends StatelessWidget {
  const SocialResponsibility({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primary_grey_color,
      appBar: AppBar(
        centerTitle: true,
        title: Text('مسولیت های اجتماعی'),
        automaticallyImplyLeading: true,

        // backgroundColor: secondary_dark_purple_color,
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('موفقیت بسیاری از سازمان های بزرگ در سطح ملی و بین المللی با درنظر گرفتن حرکت سازمان ها به سمت و سوی اهداف و آرمان های خود، مرهون انجام یک سری اقدامات در راستای افزایش سطح فرهنگی،‌ سلامت ، اطلاعات و .. جامعه، مردم و محیط زیست می باشد که از آن به عنوان رسالت اجتماعی یاد می شود.'),
                  Text('با توجه به ماهیت امدادی شرکت امداد خودرو سایپا این خصیصه در تمامی ارکان این شرکت نهادینه شده است.'),
                  Text('شرکت امدادخودروسایپا به عنوان زیر مجموعه گروه خودروسازی سایپا نیز با توجه به پیشینه تشکیل آن سوای از رسالت اقتصادی خود، همیشه نگاهی جدا از یک بنگاه اقتصادی به جامعه و مردم عزیز کشور داشته و سعی نموده تا در شرایط مختلف، حضور خود را در کنار همه اقشار جامعه حفظ کرده و دوشادوش هموطنان عزیز بخشی از منابع خود را به دور از نگاه انتفاعی صرف امور عام المنفعه نماید.'),
                 Text('همراهی با موسسات خیریه و مردمی از جمله خیریه نیکسا، سازمان انتقال خون، ستاد مقابله با کرونا، عضویت در کارگروه های محیط زیستی گروه سایپا و یا مشارکت در حرکت های اجتماعی بزرگ و دارای فوریت مانند سیل، زلزله و ... بخشی از فعالیت های فرهنگی و عام المنفعه این شرکت امدادی می باشد.'),
                  Text('در همین راستا با توجه به اهمیت سلامت جامعه و پس از شیوع ویروس کرونا این شرکت اقدام به اطلاع رسانی، توزیع اقلام بهداشتی و کمک به کاهش تردد های غیر ضروری با افزایش خدمات خودرو در محل نموده است.'),
                  Text('کارکنان و مدیران شرکت امدادخودروسایپا بر این باورند که هر چه سطح دانش و آگاهی افراد یک جامعه در جایگاه مطلوبی باشد، آن جامعه از رفاه و امنیت بیشتری برخوردار است؛ لذا هر قدمی در جهت اعتلای سطح دانش و آگاهی و رفاه جامعه را بر خود واجب می دانند.'),
                  

                ],
              ),
            ),

            // SizedBox(
            //   height: defaultPadding,
            // ),




          ],
        ),
      ),
    );
  }
}