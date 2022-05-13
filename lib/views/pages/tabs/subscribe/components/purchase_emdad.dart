import 'package:emdad_khodro_saipa/constants.dart';
import 'package:flutter/material.dart';

import '../../../DevelopingPage.dart';

class PurchaseEmdad extends StatefulWidget {
  const PurchaseEmdad({Key? key}) : super(key: key);

  @override
  _PurchaseEmdadState createState() => _PurchaseEmdadState();
}

class _PurchaseEmdadState extends State<PurchaseEmdad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(defaultPadding),

        child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            padding: EdgeInsets.all(defaultPadding),
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
            children: [

              //7 days
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage()));
                },
                child: Container(
                  height: 180,
                  width: 100,
                  decoration: BoxDecoration(
                    color: color_holoGrey_primaryLight,
                    borderRadius: BorderRadius.circular(30)

                  ),
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/purchase_emdad.png', height: 80,width: 80, fit: BoxFit.cover,),
                      ),

                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('هفت روزه'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text('۱۰.۰۰۰ تومان')),
                      )

                    ],
                  ),
                ),
              ),


              //14 days
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage()));
                },
                child: Container(
                  height: 180,
                  width: 100,
                  decoration: BoxDecoration(
                    color: color_holoGrey_primaryLight,
                    borderRadius: BorderRadius.circular(30)

                  ),
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/purchase_emdad.png', height: 80,width: 80, fit: BoxFit.cover,),
                      ),

                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('چهارده روزه'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text('۱۸.۰۰۰ تومان')),
                      )

                    ],
                  ),
                ),
              ),


              // 1 year
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage()));
                },
                child: Container(
                  height: 180,
                  width: 100,
                  decoration: BoxDecoration(
                    color: color_holoGrey_primaryLight,
                    borderRadius: BorderRadius.circular(30)

                  ),
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/purchase_emdad.png', height: 80,width: 80, fit: BoxFit.cover,),
                      ),

                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('یک ساله'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text('۱۹۰.۰۰۰ تومان')),
                      )
                    ],
                  ),
                ),
              ),
            ],
        ),
      ),
    );
  }
}
