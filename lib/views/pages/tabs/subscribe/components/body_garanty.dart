import 'package:emdad_khodro_saipa/constants.dart';
import 'package:flutter/material.dart';

class BodyGaranty extends StatefulWidget {
  const BodyGaranty({Key? key}) : super(key: key);

  @override
  _BodyGarantyState createState() => _BodyGarantyState();
}

class _BodyGarantyState extends State<BodyGaranty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset('assets/images/body_garanty.png', height: 120,fit: BoxFit.cover,),

            SizedBox(height: defaultPadding,),

            Text('برای ثبت درخواست گارانتی بدنه کلیک نمائید'),

            SizedBox(height: defaultPadding,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: color_holoGrey_primaryLight
                ),
                onPressed: (){},
                child: Text('گارانتی بدنه')
            )

          ],
        ),
      ),
    );
  }
}
