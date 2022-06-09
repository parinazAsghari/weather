import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:emdad_khodro_saipa/constants.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/emdad_in_place/submit_address.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/submit_emdad_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mapir_raster/mapir_raster.dart';

import '../../../../../../api_provider/provider.dart';
import '../../../../drop_down.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:flutter_map/flutter_map.dart' as flutterMap;
import 'package:flutter/foundation.dart' show kIsWeb;

//Todo skip refactoring

class EmdadInPlaceMap extends StatefulWidget {
  final String title;
  final bool hasCarProblem;

  EmdadInPlaceMap({
    required this.title,
    required this.hasCarProblem,
    Key? key,
  }) : super(key: key);

  @override
  _EmdadInPlaceMapState createState() => _EmdadInPlaceMapState();
}

class _EmdadInPlaceMapState extends State<EmdadInPlaceMap> {
  //map
  GoogleMapController? _controller;
  static  LatLng _center = const LatLng(35.748, 51.328);
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  BitmapDescriptor? customIcon;
  LatLng _lastMapPosition = _center;
  Location currentLocation = Location();



  List<Marker> markersList = [];


  TextEditingController _addressController = TextEditingController();

  String? _myAddress;



  // map.ir map

  flutterMap.MapController _mapController = flutterMap.MapController();
  var pos =  latlng.LatLng(35.748, 51.328);
  flutterMap.Marker _mapMarker = flutterMap.Marker(
    point: latlng.LatLng(35.748, 51.328),
    builder: (ctx) {
      return Container(
        child: Icon(Icons.location_on_rounded, size: 50, color: dark_theme_secondary,),
      );
    },
  );



  Map<String, dynamic> myAddressesListItem = {
    'آدرس های من': 'آدرس های من',

    'بلوار آیت الله کاشانی، استان تهران': 'بلوار آیت الله کاشانی، استان تهران',
    'بن بست شكوفه، استان تهران': 'بن بست شكوفه، استان تهران',
    'خیابان تیسفون، استان تهران': 'خیابان تیسفون، استان تهران',
  };


  void markerLoadings()async{
    final Uint8List markerIcon = await getBytesFromAsset('assets/images/car.png', 100);
    // final Marker marker = Marker(icon: BitmapDescriptor.fromBytes(markerIcon));

    setState(() {
      customIcon = BitmapDescriptor.fromBytes(markerIcon);
    });
  }
  Future<void> _onMapCreated(GoogleMapController controller) async {

    final Uint8List markerIcon = await getBytesFromAsset('assets/images/ic_marker.png', 200);
    // final Uint8List markerIcon = await getBytesFromAsset('assets/images/car.png', 200);
    // final Marker marker = Marker(icon: BitmapDescriptor.fromBytes(markerIcon));

    setState(() {
      customIcon = BitmapDescriptor.fromBytes(markerIcon);
      // _controller.complete(controller);
      _controller = controller;

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
      _onCurrentLocationButtonPressed();
    });

  }
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
    setState(() {
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

      // callApi(_lastMapPosition);

    });
  }
  Future<void> _onCurrentLocationButtonPressed() async {

    var location = await currentLocation.getLocation();
    // currentLocation.onLocationChanged.listen((LocationData loc){
    //
    //   _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
    //     target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
    //     zoom: 17.0,
    //   )));
    //
    //   _center = LatLng(loc.latitude!, loc.longitude!);
    //
    //
    // });

    print('this is latlong:    ${location.longitude!} + ${location.latitude!} ');
    _center = LatLng(location.latitude!, location.longitude!);



    setState(() {
      final marker = Marker(
        markerId: MarkerId('place_name'),
        position: _center,
        // icon: BitmapDescriptor.defaultMarker,
        icon: customIcon!,
        infoWindow: InfoWindow(
          title: 'شما اینجایید',
          // snippet: 'address',
        ),
      );


      markers[MarkerId('place_name')] = marker;
      _controller!.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: _center,
              zoom: 17
          )));

      // _panelController.open();


      // callApi(_center);


    });
  }
  void callApi(LatLng latLng)async{


    print('this is latlng ===>>>>>>> $latLng');
    var result = await ApiProvider.getAddress(latLng);

    print(result.addressCompact);
    _addressController.text = result.addressCompact!;



  }



  Future<void> _onFlutterMapCreated(flutterMap.MapController mapController) async {

    var location = await currentLocation.getLocation();

    setState(() {
      pos = latlng.LatLng(location.latitude!, location.longitude!);

      _lastMapPosition = LatLng(location.latitude!, location.longitude!);
      _center = LatLng(location.latitude!, location.longitude!);

      _mapMarker = flutterMap.Marker(
        point: pos,
        builder: (ctx) {
          return Container(
            child: Icon(Icons.location_on_rounded, size: 60, color: dark_theme_secondary ,),
          );
        },
      );
    });


    // flutterMap.

  }
  void _onFlutterMaoPositionChanged(flutterMap.MapPosition position, bool status){

    if(status){

      setState(() {
        pos = position.center!;
        _lastMapPosition = LatLng(position.center!.latitude, position.center!.longitude);
        _center = LatLng(position.center!.latitude, position.center!.longitude);

        _mapMarker = flutterMap.Marker(
          point: position.center!,
          builder: (ctx) {
            return Container(
              child: Icon(Icons.location_on_rounded, size: 60, color: dark_theme_secondary ,),
            );
          },
        );
      });
    }

  }


  @override
  void dispose() {
    _controller?.dispose();
    _addressController.dispose();
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
      ),      body: Container(
      child: Stack(
        children: [



          kIsWeb?
          Stack(

            children: [

              MapirMap(
                apiKey: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjQxZmNiZjFjMzZkMWQ2ODY2Y2VmZDg5ZDcyYjkzOWNlOWU3N2FlZGFmOTZkYzVhMGU3Mjk4YTdmMTUwOTY3ZjNlOTQxYmMxYTE1ZWFiNmQwIn0.eyJhdWQiOiIxODA2MSIsImp0aSI6IjQxZmNiZjFjMzZkMWQ2ODY2Y2VmZDg5ZDcyYjkzOWNlOWU3N2FlZGFmOTZkYzVhMGU3Mjk4YTdmMTUwOTY3ZjNlOTQxYmMxYTE1ZWFiNmQwIiwiaWF0IjoxNjUzMzg3MDkxLCJuYmYiOjE2NTMzODcwOTEsImV4cCI6MTY1NTk3OTA5MSwic3ViIjoiIiwic2NvcGVzIjpbImJhc2ljIl19.jDw7w-nTooFaIOmB5ufzDhGu5ESYzD_jUDkvfHh6HunR8Jk3dORUXoHwFw54vCZW4OS9Vrnyv5M1Qd-VJZ9KgMboM_vx5R3bzOCnsCr9IKZ7k3J_EXZzQgYdf1m9G0TNijr5Y9mIWKZPVyt-FODyeg0BzjS-YaxYKLioy0LzUUzDG4OgA9bn-MvlbmZA2zTwwqCpjF89DwUuCkghtehrPtW_VSn_sJ4y6dhcngDiW6hJmD8HGFmOGH1WDp31aZxukkp3QYEl0fihhh23vgU7ll7Oiz4pTztLoErOd_6QL7xxmGjaTcsh8L8os3lz-h34GqOlREozkyTVp6V4pgcMlA',
                options: flutterMap.MapOptions(
                  onMapCreated: _onFlutterMapCreated,
                  controller: _mapController,
                  onPositionChanged: _onFlutterMaoPositionChanged,
                  center: pos,
                  zoom: 17.0,
                ),
                mapController: _mapController,

                layers: [
                  flutterMap.MarkerLayerOptions(
                    markers: [
                      // _mapMarker
                      // flutterMap.Marker(
                      //   width: 80.0,
                      //   height: 80.0,
                      //   point: pos,
                      //   // builder: (ctx) => const FlutterLogo(),
                      //   builder: (ctx) {
                      //     return Container(
                      //         child: Icon(Icons.location_on_rounded, size: 40),
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                ],
              ),


              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on_rounded,size: 60,
                      color: dark_theme_secondary,
                    ),
                    SizedBox(height: defaultPadding*7,)
                  ],
                ),
              ),
            ],
          )

          :

          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 20.0,

            ),
            onCameraMove: _onCameraMove,
            markers: markers.values.toSet(),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,


            zoomControlsEnabled: false,
            zoomGesturesEnabled: true,
          ),









          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Padding(
                //   padding:  EdgeInsets.all(defaultPadding),
                //   child: _customDropDown(),
                // ),

                // _addressWidget(),
                // SizedBox(height: defaultPadding,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _submitButton(),
                ),
                SizedBox(height: defaultPadding*2,)
              ],
            ),
          )
        ],
      ),
    ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: _onSubmitTap(),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: color_sharp_orange, width: 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            color: color_sharp_orange),
        width: double.infinity,
        height: MediaQuery.of(context).size.height*33/520,
        margin: const EdgeInsets.only(right: 24, left: 24, bottom: 0),
        child: const Text(
          'تائید و ادامه',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _onSubmitTap(){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> SubmitAddress(latLng: _lastMapPosition,),),);

  }

  Widget _addressWidget(){
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: color_sharp_orange, width: 1),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          color: Colors.white
      ),

      width: double.infinity,
      height: MediaQuery.of(context).size.height*33/520,
      margin: const EdgeInsets.only(right: 24, left: 24, bottom: 0),
      child: TextField(
        controller: _addressController,
        decoration: InputDecoration(
          suffixIcon: IconButton(icon: Icon(Icons.search),onPressed: (){},),
        ),

      ),
    );
  }

  Widget _customDropDown() {
    return Container(
      margin: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 11,
      ),
      child: FormDropDown(
        readOnlyDropDown: false,
        primaryBackgroundColor: Colors.white,
        iconColor: Colors.pink,
        dropdownMenuItemStyle: const TextStyle(color: Colors.black),
        // defaultValue: _defaultValue,
        // firstItemSelectMessage: 'انتخاب',
        alignmentCenterLeft: false,
        enabledBorderColor: Colors.black,
        items: myAddressesListItem,
        validations: const [],
        onChange: (value) {
          _myAddress = value;
          _addressController.text = value;
        },
      ),
    );
  }


}
