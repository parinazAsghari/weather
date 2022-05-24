import 'package:emdad_khodro_saipa/constants.dart';
import 'package:emdad_khodro_saipa/views/pages/DevelopingPage.dart';
import 'package:flutter/material.dart';

class QuestionnaireTab extends StatefulWidget {
  const QuestionnaireTab({Key? key}) : super(key: key);

  @override
  _QuestionnaireTabState createState() => _QuestionnaireTabState();
}

class _QuestionnaireTabState extends State<QuestionnaireTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primary_grey_color,

      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Icon(Icons.question_answer_rounded, size: 130,
              // color: secondary_light_grey_color,
            ),

            SizedBox(height: defaultPadding,),

            Text('با شرکت در نظرسنجی ما را در ارائه بهتر خدمات یاری نمائید',style: TextStyle(fontWeight: FontWeight.bold),),

            SizedBox(height: defaultPadding,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              // primary: secondary_light_grey_color
            ),
          onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> DevelopingPage()));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('شروع نظرسنجی', style: TextStyle(
                // color: primary_grey_color
            ),),
          )
    )

          ],
        ),
      ),
    );
  }
}
