import 'package:emdad_khodro_saipa/constants.dart';
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
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset('assets/images/polls.png', height: 120,fit: BoxFit.cover,),

            SizedBox(height: defaultPadding,),

            Text('با شرکت در نظرسنجی ما را در ارائه بهتر خدمات یاری نمائید'),

            SizedBox(height: defaultPadding,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: color_holoGrey_primaryLight
            ),
          onPressed: (){},
          child: Text('شروع نظرسنجی')
    )

          ],
        ),
      ),
    );
  }
}
