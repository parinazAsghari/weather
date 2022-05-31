import 'package:emdad_khodro_saipa/constants.dart';
import 'package:emdad_khodro_saipa/views/pages/add_new_car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SliderItemWidget extends StatefulWidget {
  const SliderItemWidget({Key? key,required this.showingTexts,required this.imagePath}) : super(key: key);

 final String imagePath;
 final Widget showingTexts;
  @override
  State<SliderItemWidget> createState() => _SliderItemWidgetState();
}

class _SliderItemWidgetState extends State<SliderItemWidget> {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [

        Align(
          alignment: Alignment.bottomRight,
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const AddNewCar()));
            },
            child: Container(
              // alignment: Alignment.bottomRight,
              height: 200,
              width: MediaQuery.of(context).size.width * 0.80,
              margin: EdgeInsets.only(top: defaultPadding*2, bottom: defaultPadding, right: defaultPadding, left: defaultPadding),
              child: Neumorphic(
                style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),
                  depth: 3,
                  lightSource: LightSource.topLeft,
                  color: Theme.of(context).cardColor,
                  shadowDarkColor: Theme.of(context).shadowColor,

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 2,),
                    widget.showingTexts,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/car_plate.png', width: MediaQuery.of(context).size.width*0.28, fit: BoxFit.cover,),
                      // 'assets/images/car_plate.png'
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        Align(
          alignment: Alignment.topLeft,
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddNewCar()));

            },
            child: Container(
              margin: EdgeInsets.all(defaultPadding),
              width: 140,
              height: 140,
              child: Neumorphic(
                style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),
                  depth: 3,
                  lightSource: LightSource.topLeft,
                  color: Theme.of(context).primaryColorLight,
                  shadowDarkColor: Theme.of(context).shadowColor,

                ),
                child: Stack(
                  children: [
                    Center(child: Image.asset(widget.imagePath, fit: BoxFit.contain,),),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                            width: 35,
                            height: 35,
                            decoration: const BoxDecoration(shape:BoxShape.circle,color: Color(0xFF2E3D3D),),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/images/plus.png', fit: BoxFit.contain,),
                            )

                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ),
          ),
        )
      ],
    );
  }
}
