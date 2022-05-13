import 'package:emdad_khodro_saipa/constants.dart';
import 'package:flutter/material.dart';

class Renew extends StatefulWidget {
  const Renew({Key? key}) : super(key: key);

  @override
  _RenewState createState() => _RenewState();
}

class _RenewState extends State<Renew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset('assets/images/renew.png', height: 120,fit: BoxFit.cover,),

            SizedBox(height: defaultPadding,),

            Text('برای ثبت درخواست تمدید اشتراک کلیک نمائید'),

            SizedBox(height: defaultPadding,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: color_holoGrey_primaryLight
                ),
                onPressed: (){},
                child: Text('تمدید اشتراک')
            )

          ],
        ),
      ),
    );
  }
}
