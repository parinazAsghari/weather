import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../widgets/DialogWidgets.dart';

class MyAddressesPage extends StatefulWidget {
  const MyAddressesPage({Key? key}) : super(key: key);

  @override
  State<MyAddressesPage> createState() => _MyAddressesPageState();
}

class _MyAddressesPageState extends State<MyAddressesPage> {
  List<Address> addressList = [
    Address(address: 'بلوار آیت الله کاشانی، استان تهران، تهران، فردوس، ایران'),
    Address(address: 'بن بست شكوفه، استان تهران، تهران، ایران'),
    Address(address: 'خیابان تیسفون، استان تهران'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          'آدرس های من',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: () {
            },
            child: Row(
              children: [
                Icon(
                  Icons.add,
                  color: color_sharp_orange,
                ),
                SizedBox(width: 4,),
                Text(
                  "افزودن",
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 10,),

              ],
            ),
          ),
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    if (addressList.isNotEmpty) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return _itemBox(context, index);
        },
        itemCount: addressList.length,
      );
    } else {
      return emptyWidget();
    }
  }

  Widget emptyWidget() {
    return Center(
      child: Text('هیچ آدرسی انتخاب نشده است.'),
    );
  }

  Widget _itemBox(context, index) {
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (BuildContext context)
        {
          return MessageDialogWidget(
            dismissable: true,
            body: addressList[index].address,
            positiveTxt: 'باشه',
          );
        });
      },
      child: Container(
        width: 340,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(
          //   width: 1,
          //   color: Colors.black.withOpacity(0.2),
          // ),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Colors.black,
                offset: Offset(0, 0),
                spreadRadius: 0,
                blurRadius: 3),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.only(
          right: 8,
          left: 8,
          top: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              color: color_sharp_orange,
            ),
            SizedBox(
              width: 250,
              child: Text(
                ellypsisPersianText(addressList[index].address?? '') ,
                style: const TextStyle(fontSize: 18),
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.rtl,
              ),
            ),
            IconButton(
              onPressed: () {
                if (addressList.isNotEmpty) {
                  setState(() {
                    addressList.removeAt(index);
                  });
                }
              },
              icon: Icon(
                Icons.delete,
                color: color_sharp_orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  String ellypsisPersianText(String text){
    if(text.length<33){
      return text;
    }else {
      return text.replaceAll(text, '${text.substring(0,33)}...',);
    }
    
  }
  
}

class Address {
  String? address;

  Address({this.address});
}
