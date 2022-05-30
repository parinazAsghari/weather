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
      // backgroundColor: primary_grey_color,
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
                      color: Color(0xFFEEF0F6),
                    borderRadius: BorderRadius.circular(30)

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 180,
                          height: 80,
                          decoration: BoxDecoration(
                            color:  const Color(0xFF2E3D3D),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 5,),
                              const Text('اشتراک سفر',style: TextStyle(color: Color(0xFFFF6B00)),),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color:  const Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(5),
                                ),

                                child: Image.asset('assets/images/travel_car.png',fit: BoxFit.cover,),
                              ),
                              const SizedBox(width: 5,),
                            ],
                          ),
                        ),
                      ),

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
                      color: const Color(0xFFEEF0F6),
                    borderRadius: BorderRadius.circular(30)

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 180,
                          height: 80,
                          decoration: BoxDecoration(
                            color:  const Color(0xFF2E3D3D),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 5,),
                              const Text('اشتراک عمومی',style: TextStyle(color: Color(0xFFFF6B00)),),
                              Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color:  const Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(5),
                                  ),

                                  child: Image.asset('assets/images/public_car.png',fit: BoxFit.cover,),
                              ),
                              const SizedBox(width: 5,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                    )
                                )
                            ),
                            onPressed: () {
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'پرداخت',
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            )),
                      ),

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
