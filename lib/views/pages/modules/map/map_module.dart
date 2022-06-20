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

class MapModule extends StatefulWidget {


  MapModule({
    Key? key,
  }) : super(key: key);

  @override
  _MapModuleState createState() => _MapModuleState();
}

class _MapModuleState extends State<MapModule> {

  //map
  GoogleMapController? _controller;
  static LatLng _center = const LatLng(35.748, 51.328);
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  BitmapDescriptor? customIcon;
  LatLng _lastMapPosition = _center;
  Location currentLocation = Location();
  List<Marker> markersList = [];

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final Uint8List markerIcon =
    await getBytesFromAsset('assets/images/ic_marker.png', 200);

    customIcon = BitmapDescriptor.fromBytes(markerIcon);
    _controller = controller;


    var location = await currentLocation.getLocation();
    _center = _lastMapPosition = LatLng(location.latitude!, location.longitude!);


    final marker = Marker(
      markerId: MarkerId('place_name'),
      position: _lastMapPosition,
      // icon: BitmapDescriptor.defaultMarker,
      icon: customIcon!,
      infoWindow: InfoWindow(
        title: 'شما اینجایید',
        // snippet: 'address',
      ),
    );

    markers[MarkerId('place_name')] = marker;


    _controller!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _center, zoom: 19)));

    setState((){

    });

  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
    final marker = Marker(
      markerId: MarkerId('place_name'),
      position: _lastMapPosition,
      icon: customIcon!,
      infoWindow: InfoWindow(
        title: 'شما اینجایید',
      ),
    );

    markers[MarkerId('place_name')] = marker;
    setState((){

    });
  }

  @override
  void dispose() {
    super.dispose();

    _controller?.dispose();
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
        child: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 14.0,
              ),
              onCameraMove: _onCameraMove,
              markers: markers.values.toSet(),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: true,

            ),


            //bottom center button - confirm and continue
            _customButton(),


            //search text field - top center
            _searchTextField(),
            // _customSearch()

          ],
        ),
      ),
    );
  }

  Widget _customButton(){
    return  Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomSubmitButton(
              onTap: () {
                Navigator.pop(context, LatLng(_lastMapPosition.latitude, _lastMapPosition.longitude));

              },
              text: 'تائید و ادامه',
              marginBottom: 0,
              marginTop: 0,
            ),
          ),
          SizedBox(
            height: defaultPadding * 2,
          )
        ],
      ),
    );
  }

  final _userEditTextController = TextEditingController(text: 'Mrs');

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
            margin: EdgeInsets.only(left: 8, right: 60, top: 8),
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
