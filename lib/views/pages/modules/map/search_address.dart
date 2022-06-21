import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:emdad_khodro_saipa/constants.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/submit_emdad_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mapir_raster/mapir_raster.dart';
import '../../../../../api_provider/provider.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:flutter_map/flutter_map.dart' as flutterMap;
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../../widgets/custom_submit_button.dart';
import '../../drop_down.dart';

class SearchAddress extends StatefulWidget {


  SearchAddress({
    Key? key,
  }) : super(key: key);

  @override
  _SearchAddressState createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {

 
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
    List<DropdownMenuItem> items = [
      DropdownMenuItem(child: Text('hello'))
    ];
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [


          Container(
            height: 50,
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),

            ),
            child: DropdownSearch<UserModel>(
              asyncItems: (String? filter) => getData(filter),
              popupProps: PopupPropsMultiSelection.menu(
                showSelectedItems: true,
                itemBuilder: _customPopupItemBuilderExample2,
                showSearchBox: true,
              ),
              compareFn: (item, sItem) => item.id == sItem.id,
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  hintText: 'متن جستجو را وارد کنید',
                  labelText: 'جستجو ...',
                  // filled: true,
                  // fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
  Future<List<UserModel>> getData(filter) async {
    var response = await Dio().get(
      "https://5d85ccfb1e61af001471bf60.mockapi.io/user",
      queryParameters: {"filter": filter},
    );

    final data = response.data;
    if (data != null) {
      return UserModel.fromJsonList(data);
    }

    return [];
  }
  Widget _customDropDownExampleMultiSelection(BuildContext context, List<UserModel?> selectedItems) {
    if (selectedItems.isEmpty) {
      return ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(),
        title: Text("No item selected"),
      );
    }

    return Wrap(
      children: selectedItems.map((e) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            child: ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                // this does not work - throws 404 error
                // backgroundImage: NetworkImage(item.avatar ?? ''),
              ),
              title: Text(e?.name ?? ''),
              subtitle: Text(
                e?.createdAt.toString() ?? '',
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
  Widget _customPopupItemBuilderExample2(BuildContext context, UserModel? item, bool isSelected,) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: ListTile(
        selected: isSelected,
        title: Text(item?.name ?? ''),
        subtitle: Text(item?.createdAt?.toString() ?? ''),
        leading: CircleAvatar(
          // this does not work - throws 404 error
          // backgroundImage: NetworkImage(item.avatar ?? ''),
        ),
      ),
    );
  }

}

class UserModel {
  final String id;
  final DateTime? createdAt;
  final String name;
  final String? avatar;

  UserModel(
      {required this.id, this.createdAt, required this.name, this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      createdAt:
      json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
      name: json["name"],
      avatar: json["avatar"],
    );
  }

  static List<UserModel> fromJsonList(List list) {
    return list.map((item) => UserModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.name}';
  }

  ///this method will prevent the override of toString
  bool userFilterByCreationDate(String filter) {
    return this.createdAt?.toString().contains(filter) ?? false;
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(UserModel model) {
    return this.id == model.id;
  }

  @override
  String toString() => name;
}

