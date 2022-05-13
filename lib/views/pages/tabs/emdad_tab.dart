import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../constants.dart';


class EmdadTab extends StatefulWidget {
  const EmdadTab({Key? key}) : super(key: key);

  @override
  _EmdadTabState createState() => _EmdadTabState();
}

class _EmdadTabState extends State<EmdadTab> {

  GoogleMapController? _controller;

  static const LatLng _center = const LatLng(35.748, 51.328);

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  BitmapDescriptor? customIcon;

  LatLng _lastMapPosition = _center;





  Future<void> _onMapCreated(GoogleMapController controller) async {

    final Uint8List markerIcon = await getBytesFromAsset('assets/images/car.png', 200);
    // final Marker marker = Marker(icon: BitmapDescriptor.fromBytes(markerIcon));

    setState(() {
      customIcon = BitmapDescriptor.fromBytes(markerIcon);
    });

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

    setState(() {
      markers[MarkerId('place_name')] = marker;
    });
  }


  @override
  void initState() {
    super.initState();
    // make sure to initialize before map loading

    // markerLoadings();

  }


  // void markerLoadings()async{
  //   final Uint8List markerIcon = await getBytesFromAsset('assets/images/car.png', 100);
  //   // final Marker marker = Marker(icon: BitmapDescriptor.fromBytes(markerIcon));
  //
  //   setState(() {
  //     customIcon = BitmapDescriptor.fromBytes(markerIcon);
  //   });
  // }



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

    });
  }


  void _onCurrentLocationButtonPressed(){
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [


          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 17.0,

            ),
            onCameraMove: _onCameraMove,
            markers: markers.values.toSet(),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,

            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      _onCurrentLocationButtonPressed();
                    },
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: color_sharp_orange_low,
                    child:  Icon(Icons.location_on_rounded,
                        color: color_holoGrey_primaryLight,
                        size: 36.0),
                  ),

                  SizedBox(height: defaultPadding,),

                  FloatingActionButton(
                    onPressed: () => print('button pressed'),
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: color_sharp_orange_low,
                    child:  Icon(Icons.add_box_rounded,
                        color: color_holoGrey_primaryLight,
                        size: 36.0),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
