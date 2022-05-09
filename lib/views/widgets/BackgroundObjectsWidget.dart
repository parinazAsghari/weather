import 'package:flutter/material.dart';

class BackgroundObjectsWidget extends StatelessWidget{

  Widget widget = Container();
  BackgroundObjectsWidget({required this.widget});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          child: Stack(
            children: [

              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 60,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/TopLeft.png',fit: BoxFit.fill,width: MediaQuery.of(context).size.width/2 -30,),
                          Image.asset('assets/images/TopRight.png', fit: BoxFit.fill,width: MediaQuery.of(context).size.width/2 -30,),

                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/BottomLeft.png',fit: BoxFit.fill,width: MediaQuery.of(context).size.width/2 -30,),
                          Image.asset('assets/images/BottomRight.png', fit: BoxFit.fill,width: MediaQuery.of(context).size.width/2 -30,),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
              widget,


            ],
          ),
        ));
  }
}




class BackgroundObjectsComplexWidget extends StatelessWidget{

  Widget widget;
  BackgroundObjectsComplexWidget({required this.widget});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          child: Stack(
            children: [

              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // margin: EdgeInsets.only(bottom: 60,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/images/TopLeft.png',fit: BoxFit.fill,width: MediaQuery.of(context).size.width/2 -30,),
                          Image.asset('assets/images/TopRight.png', fit: BoxFit.fill,width: MediaQuery.of(context).size.width/2 -30,),

                        ],
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(bottom: 80,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/TopCenter.png',fit: BoxFit.fill,width: MediaQuery.of(context).size.width/2 -30,),
                          // Image.asset('assets/images/TopRight.png', fit: BoxFit.fill,width: MediaQuery.of(context).size.width/2 -30,),

                        ],
                      ),
                    ),

                    Container(
                      // margin: EdgeInsets.only(top: 60,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/images/BottomLeft.png',fit: BoxFit.fill,width: MediaQuery.of(context).size.width/2 -30,),
                          Image.asset('assets/images/BottomRight.png', fit: BoxFit.fill,width: MediaQuery.of(context).size.width/2 -30,),

                        ],
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(top: 20,),
                      child: Center(child: Image.asset('assets/images/BottomCorner.png',fit: BoxFit.fill,width: MediaQuery.of(context).size.width/2 -30,)),
                    ),

                  ],
                ),
              ),
              widget,


            ],
          ),
        ));
  }
}