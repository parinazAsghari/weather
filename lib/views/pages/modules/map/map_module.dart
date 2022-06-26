import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:emdad_khodro_saipa/constants.dart';
import 'package:emdad_khodro_saipa/views/pages/modules/map/search_address.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/submit_emdad_request.dart';
import 'package:emdad_khodro_saipa/views/widgets/custom_neomorphic_box.dart';
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


  //map - google map - android platform
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
    _lastMapPosition = _center = position.target;

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

  Future<void> _onCurrentLocationButtonPressed() async {

    var location = await currentLocation.getLocation();
    _center = LatLng(location.latitude!, location.longitude!);

    print('this is location m=======>>>  $_center');


    if(kIsWeb){
      setState(() {

        _mapController.move(latlng.LatLng(location.latitude!, location.longitude!), 17);
      });
    }
    else{
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

      });
    }
  }



  // map.ir map - PWA web platform

  flutterMap.MapController _mapController = flutterMap.MapController();
  var pos =  latlng.LatLng(35.748, 51.328);

  Future<void> _onFlutterMapCreated(flutterMap.MapController mapController) async {

    var location = await currentLocation.getLocation();

    setState(() {
      pos = latlng.LatLng(location.latitude!, location.longitude!);
      // pos = latlng.LatLng(35.758688, 51.305858);

      _lastMapPosition = LatLng(location.latitude!, location.longitude!);
      // _lastMapPosition = LatLng(35.758688, 51.305858);
      _center = LatLng(location.latitude!, location.longitude!);
      // _center = LatLng(35.758688, 51.305858);

    });

    _mapController.move(pos, 17);
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
          'assets/images/emdad_khodro_logo.png',
          // height: 30,
          width: MediaQuery.of(context).size.width * 0.45,
          fit: BoxFit.contain,
        ),
      ),
      body: Container(
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
                    // onPositionChanged: _onFlutterMaoPositionChanged,
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
                      InkWell(
                        onTap: (){
                        },
                        child: Icon(Icons.location_on_rounded,size: 60,
                          color: dark_theme_secondary,
                        ),
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
                zoom: 14.0,
              ),
              onCameraMove: _onCameraMove,
              markers: markers.values.toSet(),
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: true,

            ),


            //bottom center button - confirm and continue
            _customButton(),


            // search bar - current location floating action button
            Column(
              children: [
                _searchAddressButton(),

                _customFloatingActionButton(),

              ],
            ),
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
                if(kIsWeb){
                  _lastMapPosition = LatLng(pos.latitude, pos.longitude);
                }
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


  Widget _searchAddressButton(){

    return InkWell(
      onTap: () async {
        LatLng latLng = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchAddress(userLastLatLng: _center,)));

        print('this is latlng back from search =====> $latLng');

        if(kIsWeb){
          //web config - map.ir config
          pos = latlng.LatLng(latLng.latitude, latLng.longitude);
          _mapController.move(pos, 17);
        }else{
          //android config - google map config
          _center = _lastMapPosition = latLng;
          _controller!.animateCamera(CameraUpdate.newLatLng(latLng));

        }
      },

      child: Neumorphic(
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
        child: ListTile(
          title: Text('جستجو ....'),
        ),
      ),
    );
  }


  Widget _customFloatingActionButton(){
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(right: 16,top: 8),
        child: FloatingActionButton(
          onPressed: (){

            _onCurrentLocationButtonPressed();
          },
          child: Icon(Icons.location_on_rounded),

        ),
      ),
    );
  }

}