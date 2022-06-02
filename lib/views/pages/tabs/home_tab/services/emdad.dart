import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:emdad_khodro_saipa/constants.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/submit_emdad_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../../../api_provider/provider.dart';
import '../../../drop_down.dart';


class EmdadService extends StatefulWidget {
  final String title;
  final bool hasCarProblem;

  EmdadService({
    required this.title,
    required this.hasCarProblem,
    Key? key,
  }) : super(key: key);

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

  String? _myAddress;



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
          height: 30,
          width: MediaQuery.of(context).size.width * 0.35,
          fit: BoxFit.contain,
        ),
      ),      body: Container(
        child: Stack(
          children: [

            // Container(
            //   child: Center(
            //     child: Text(
            //       'Map is Here in the back'
            //     ),
            //   ),
            // ),


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
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> SubmitEmdadRequest(latLng: _lastMapPosition, title: widget.title, hasCarProblem: widget.hasCarProblem,address: _addressController.text.isEmpty?'':_addressController.text,)));
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
