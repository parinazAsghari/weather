
import 'package:emdad_khodro_saipa/constants.dart';
import 'package:emdad_khodro_saipa/views/pages/add_new_car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CarBoxItemWidget extends StatefulWidget {
  const CarBoxItemWidget(
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
        this.fourthCarTag,
        required this.index})
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
  final int index;

  @override
  State<CarBoxItemWidget> createState() => _CarBoxItemWidgetState();
}

class _CarBoxItemWidgetState extends State<CarBoxItemWidget> {

  void _onCarBoxTap(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => AddNewCar(
          index: widget.index,
          isCarFromDataBase: widget.isCarFromDataBase,
          chassisNumber: widget.isCarFromDataBase ? widget.chassisNumber : null,
          ownerNationalCode: widget.isCarFromDataBase ? widget.ownerNationalCode : null,
          firstCarTag: widget.isCarFromDataBase ? widget.firstCarTag : null,
          secondCarTag: widget.isCarFromDataBase ? widget.secondCarTag : null,
          thirdCarTag: widget.isCarFromDataBase ? widget.thirdCarTag : null,
          fourthCarTag: widget.isCarFromDataBase ? widget.fourthCarTag : null,
          brand: widget.isCarFromDataBase ? widget.brand : null,
          createDate: widget.isCarFromDataBase ? widget.createDate : null,
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _onCarBoxTap();
      },
      child: widget.isCarFromDataBase
          ?
      carBoxContent()
          :
      emptyCarContent(),
    );
  }



  Widget carBoxContent(){
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            // color: Colors.red,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(
                  widget.imagePath,
                  // 'assets/images/new_car.png',
                  fit: BoxFit.cover,
                  // width: MediaQuery.of(context).size.width * 0.80,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              widget.showingTexts,

              SizedBox(
                height: 30,
              ),

              carPlate(),


            ],
          ),
        ),
      ],
    );
  }


  Widget carPlate(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1),
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(8)
      ),
      // height: 40,
      child: Row(
        children: [
          SizedBox(width: 4,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ایران',
                style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.fourthCarTag == null ? '' : widget.fourthCarTag.toString(),
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Expanded(
            child: VerticalDivider(width: 4, color: Colors.black),
          ),
          Text(
            widget.thirdCarTag == null ? '' : widget.thirdCarTag.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            widget.secondCarTag == null ? '' : widget.secondCarTag.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            widget.firstCarTag == null ? '' : widget.firstCarTag.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 5,
          ),
          // Expanded(child: Container()),
          Image.asset(
            'assets/images/iran_flag.png',
            width: 22,
            // height: 38,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }


  Widget emptyCarContent(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('برای استفاده از خدمات تخصصی مشخصات خودرو خود را وارد کنید', style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
        ),
        Expanded(child: Container()),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                // color: Colors.red,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      widget.imagePath,
                      // 'assets/images/car_shadow.png',
                      fit: BoxFit.cover,
                      // width: MediaQuery.of(context).size.width * 0.80,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // NeumorphicButton(
                  //   margin: EdgeInsets.zero,
                  //   curve: Neumorphic.DEFAULT_CURVE,
                  //   padding: EdgeInsets.all(4),
                  //   onPressed: (){
                  //     _onCarBoxTap();
                  //   },
                  //   child: SizedBox(
                  //     width: 80,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Text('افزودن خودرو  ', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                  //         Image.asset('assets/images/plus.png',color: Theme.of(context).primaryColor, height: 10,)
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        )

      ],
    );
  }
}