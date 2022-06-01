import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:emdad_khodro_saipa/constants.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/submit_emdad_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../../../api_provider/provider.dart';


class EmdadService extends StatefulWidget {
  const EmdadService({Key? key}) : super(key: key);

  @override
  _EmdadServiceState createState() => _EmdadServiceState();
}

class _EmdadServiceState extends State<EmdadService> {
  //map
  GoogleMapController? _controller;
  static  LatLng _center = const LatLng(35.748, 51.328);
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  BitmapDescriptor? customIcon;
  LatLng _lastMapPosition = _center;
  Location currentLocation = Location();


  List<Marker> markersList = [];


  TextEditingController _addressController = TextEditingController();


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
    //     zoom: 12.0,
    //   )));
    //
    //   _center = LatLng(loc.latitude!, loc.longitude!);
    //   print(loc.latitude);
    //   print(loc.longitude);
    //   setState(() {
    //
    //   });
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


      callApi(_center);


    });
  }
  void callApi(LatLng latLng)async{


    var result = await ApiProvider.getAddress(latLng);

    print(result.addressCompact);


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [

            Container(
              child: Center(
                child: Text(
                  'Map is Here in the back'
                ),
              ),
            ),

            /*
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 17.0,

              ),
              onCameraMove: _onCameraMove,
              markers: markers.values.toSet(),
              myLocationEnabled: false,
              myLocationButtonEnabled: false,


              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
            ),

             */
            
            


            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding:  EdgeInsets.all(defaultPadding),
                child: Container(
                  color: Colors.white,
                  height: 50,
                  width: double.maxFinite,
                ),
              ),
            ),


            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  _addressWidget(),
                  SizedBox(height: defaultPadding,),
                  _submitButton(),
                  SizedBox(height: defaultPadding,)
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
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> SubmitEmdadRequest(title: 'امداد', hasCarProblem: true,)));
      },
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

  Widget _addressWidget(){
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: color_sharp_orange, width: 1),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          // color: color_sharp_orange
      ),

      width: double.infinity,
      height: MediaQuery.of(context).size.height*33/520,
      margin: const EdgeInsets.only(right: 24, left: 24, bottom: 0),
      child: TextField(
        controller: _addressController,

      ),
    );
  }

}
