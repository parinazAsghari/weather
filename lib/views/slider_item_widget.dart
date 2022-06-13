import 'package:emdad_khodro_saipa/constants.dart';
import 'package:emdad_khodro_saipa/views/pages/add_new_car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SliderItemWidget extends StatefulWidget {
  const SliderItemWidget(
      {Key? key,
      required this.showingTexts,
      required this.imagePath,
      required this.isCarFromDataBase,
       this.chassisNumber,
       this.ownerNationalCode,
       this.brand,
       this.createDate,
       this.firstCarTag,
       this.secondCarTag,
       this.thirdCarTag,
       this.fourthCarTag})
      : super(key: key);

  final String imagePath;
  final Widget showingTexts;
  final bool isCarFromDataBase;
  final String? chassisNumber;
  final String? ownerNationalCode;
  final String? brand;
  final String? createDate;
  final int? firstCarTag;
  final String? secondCarTag;
  final int? thirdCarTag;
  final int? fourthCarTag;

  @override
  State<SliderItemWidget> createState() => _SliderItemWidgetState();
}

class _SliderItemWidgetState extends State<SliderItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width * 0.80,
            margin: EdgeInsets.only(top: defaultPadding * 2, bottom: defaultPadding, right: defaultPadding, left: defaultPadding),
            child: Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),
                // depth: 1.5,
                depth: 8,
                lightSource: LightSource.topLeft,
                color: Theme.of(context).cardColor,
                shadowDarkColor: Theme.of(context).shadowColor,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => AddNewCar(
                        isCarFromDataBase: widget.isCarFromDataBase,
                        chassisNumber: widget.isCarFromDataBase ? widget.chassisNumber : null,
                        ownerNationalCode: widget.isCarFromDataBase ? widget.ownerNationalCode : null,
                        firstCarTag: widget.isCarFromDataBase ? widget.firstCarTag :null,
                        secondCarTag: widget.isCarFromDataBase ? widget.secondCarTag :null,
                        thirdCarTag: widget.isCarFromDataBase ? widget.thirdCarTag :null,
                        fourthCarTag: widget.isCarFromDataBase ? widget.fourthCarTag :null,
                        brand: widget.isCarFromDataBase ? widget.brand :null,
                        createDate: widget.isCarFromDataBase ? widget.createDate :null,

                      ),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const SizedBox(
                    //   height: 2,
                    // ),
                    widget.showingTexts,
                    // SizedBox(
                    //   height: widget.isCarFromDataBase ? 20 : 30,
                    // ),
                    !widget.isCarFromDataBase
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 42, top: defaultPadding / 2),
                              child: Image.asset(
                                'assets/images/ic_plus.png',
                                width: MediaQuery.of(context).size.width * 0.20,
                                height: MediaQuery.of(context).size.height * 0.1,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          )

                        //car plate
                        : Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                                padding: EdgeInsets.only(right: 42, top: defaultPadding),
                                child: Container(
                                  width: 142,
                                  height: 40,
                                  // color: const Color(0xFFEEF0F6),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), border: Border.all(width: 1, color: Colors.black)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'ایران',
                                              style: const TextStyle(fontSize: 9,fontWeight: FontWeight.bold),
                                            ),
                                            Text(widget.fourthCarTag.toString(), style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                          child: VerticalDivider(
                                        color: Colors.black)
                                      ),
                                      // const SizedBox(
                                      //   width: 5,
                                      // ),
                                      Text(widget.thirdCarTag.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(widget.secondCarTag.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(widget.firstCarTag.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Image.asset(
                                        'assets/images/iran_flag.png',
                                        width: 19,
                                        height: 38,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                )
                                // 'assets/images/car_plate.png'
                                ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
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
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => AddNewCar(
                        isCarFromDataBase: widget.isCarFromDataBase,
                        chassisNumber:widget.isCarFromDataBase? widget.chassisNumber:null,
                        ownerNationalCode:widget.isCarFromDataBase? widget.ownerNationalCode:null,
                        firstCarTag: widget.isCarFromDataBase ? widget.firstCarTag :null,
                        secondCarTag: widget.isCarFromDataBase ? widget.secondCarTag :null,
                        thirdCarTag: widget.isCarFromDataBase ? widget.thirdCarTag :null,
                        fourthCarTag: widget.isCarFromDataBase ? widget.fourthCarTag :null,
                        brand: widget.isCarFromDataBase ? widget.brand :null,
                        createDate: widget.isCarFromDataBase ? widget.createDate :null,
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        widget.imagePath,
                        fit: BoxFit.contain,
                      ),
                    ),

                    /*
                    widget.brand==null? Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                            width: 35,
                            height: 35,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF2E3D3D),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/plus.png',
                                fit: BoxFit.contain,
                              ),
                            )),
                      ),
                    ):Container(),

                     */
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
