import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:emdad_khodro_saipa/constants.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/submit_emdad_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mapir_raster/mapir_raster.dart';
import '../../../../../api_provider/provider.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:flutter_map/flutter_map.dart' as flutterMap;
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../../../models/response_model/search_address_response.dart';
import '../../../widgets/custom_submit_button.dart';
import '../../drop_down.dart';

class SearchAddress extends StatefulWidget {
  SearchAddress({
    Key? key,
    required this.userLastLatLng
  }) : super(key: key);

  LatLng userLastLatLng;


  @override
  _SearchAddressState createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {

  TextEditingController _searchTextController = TextEditingController();
  FocusNode focusNode = FocusNode();

  ScrollController scrollController = ScrollController();

  SearchAddressResponse searchAddressResponse = SearchAddressResponse();

  void searchAddress()async{
     searchAddressResponse = await ApiProvider.searchAddress(_searchTextController.text , widget.userLastLatLng);
     print(searchAddressResponse.toString());
     setState((){});
  }

  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();

  }

  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          'assets/images/emdad_khodro_logo_white_text.png',
          // height: 30,
          width: MediaQuery.of(context).size.width * 0.45,
          fit: BoxFit.contain,
        ),
      ),
      body: Container(
        child: _searchTextField(),
      ),
    );
  }



  Widget _searchTextField(){
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [

            Neumorphic(
              margin: EdgeInsets.all(16),
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                // depth: 1.5,
                depth: 8,
                lightSource: LightSource.topLeft,
                color: Colors.white,
                shadowDarkColor: Theme.of(context).shadowColor,
              ),
              child: TextField(
                controller: _searchTextController,
                focusNode: focusNode,
                onChanged: (value){
                  if(value.length > 3) searchAddress();
                },
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  label: Text('جستجو ...'),
                  contentPadding: EdgeInsets.only(right: 16),

                ),
              )
            ),


            if(searchAddressResponse.value !=null)ListView.separated(
              controller: scrollController,
              shrinkWrap: true,
              itemCount: searchAddressResponse.value!.length,
              itemBuilder: (context, index){
                return ListTile(
                  onTap: (){
                    Navigator.of(context).pop(LatLng(searchAddressResponse.value![index].geom!.coordinates![1], searchAddressResponse.value![index].geom!.coordinates![0]));

                  },

                  title: Text(searchAddressResponse.value![index].address!),

                );
              },
              separatorBuilder: (context, index){
                return Divider();
              },

            )

          ],
        ),
      ),
    );
  }
}

