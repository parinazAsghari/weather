import 'dart:typed_data';
import 'dart:ui' as ui;

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
    _controller?.dispose();
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


            Align(
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
            )
          ],
        ),
      ),
    );
  }
}
