import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:emdad_khodro_saipa/api_provider/provider.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/emdad.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/submit_emdad_request.dart';
import 'package:emdad_khodro_saipa/views/widgets/custom_item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mapir_raster/mapir_raster.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:flutter_map/flutter_map.dart' as flutterMap;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../../../constants.dart';
import 'package:emdad_khodro_saipa/views/pages/modules/map/search_address.dart';


class EmdadTab extends StatefulWidget {
  const EmdadTab({Key? key}) : super(key: key);

  @override
  _EmdadTabState createState() => _EmdadTabState();
}

class _EmdadTabState extends State<EmdadTab> {



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

    if(mounted){
      setState((){

      });
    }


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
    if(mounted){
      setState((){

      });
    }

  }

  Future<void> _onCurrentLocationButtonPressed() async {

    var location = await currentLocation.getLocation();
    _center = LatLng(location.latitude!, location.longitude!);

    print('this is location m=======>>>  $_center');


    if(kIsWeb){
      if(mounted){
        setState(() {

          _mapController.move(latlng.LatLng(location.latitude!, location.longitude!), 17);
        });
      }

    }
    else{
      if(mounted){
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
  }



  // map.ir map - PWA web platform

  flutterMap.MapController _mapController = flutterMap.MapController();
  var pos =  latlng.LatLng(35.748, 51.328);

  Future<void> _onFlutterMapCreated(flutterMap.MapController mapController) async {

    var location = await currentLocation.getLocation();

    if(mounted){
      setState(() {
        pos = latlng.LatLng(location.latitude!, location.longitude!);
        // pos = latlng.LatLng(35.758688, 51.305858);

        _lastMapPosition = LatLng(location.latitude!, location.longitude!);
        // _lastMapPosition = LatLng(35.758688, 51.305858);
        _center = LatLng(location.latitude!, location.longitude!);
        // _center = LatLng(35.758688, 51.305858);

        _mapController.move(pos, 17);

      });
    }


  }




  //sliding up panel
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 350;
  double _panelHeightClosed = 80.0;
  PanelController _panelController = PanelController();


  int requestState = 0;



  @override
  void initState() {
    super.initState();

    _fabHeight = _initFabHeight;

  }

  @override
  void dispose() {
    super.dispose();

    _controller?.dispose();
  }

  void markerLoadings()async{
    final Uint8List markerIcon = await getBytesFromAsset('assets/images/car.png', 100);
    // final Marker marker = Marker(icon: BitmapDescriptor.fromBytes(markerIcon));

    if(mounted){
      setState(() {
        customIcon = BitmapDescriptor.fromBytes(markerIcon);
      });
    }

  }



  void getLocation() async{
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc){

      _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
        zoom: 12.0,
      )));

      // print(loc.latitude);
      // print(loc.longitude);
      // setState(() {
      //
      // });
    });
  }



  LatLng lastPosition(LatLng latLng){
    LatLng lastPos;
    if(kIsWeb){
      lastPos = LatLng(_mapController.center.latitude, _mapController.center.longitude);
      return lastPos;
    }
    lastPos = _lastMapPosition;
    return lastPos;

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   title: Image.asset(
      //     'assets/images/emdad_khodro_logo.png',
      //     // height: 30,
      //     width: MediaQuery.of(context).size.width * 0.45,
      //     fit: BoxFit.contain,
      //   ),
      // ),

      body: Stack(

        children: [

          SlidingUpPanel(
            controller: _panelController,
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            defaultPanelState: PanelState.OPEN,
            body: _body(),
            panelBuilder: (sc) => _panel(sc),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
            onPanelSlide: (double pos) => setState(() {
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initFabHeight;
            }),
          ),
        ],
      ),
    );




  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          shrinkWrap: true,
          controller: sc,
          children: <Widget>[
            SizedBox(
              height: 12.0,
            ),


            InkWell(
              onTap: (){
                _panelController.open();
              },
              child: Center(
                child: Container(
                  width: 60,
                  height: 10,
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
              ),
            ),

            SizedBox(
              height: 9.0,
            ),

            Container(
              child: InkWell(
                onTap: () {
                  _panelController.open();
                },
                child: Text(
                  'ثبت درخواست',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      // color: secondary_light_grey_color,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 18.0,
            ),

            // SizedBox(
            //   height: 24,
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                // CustomItemButton(
                //     title: 'امداد فوری',
                //     onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SubmitEmdadRequest(title: 'امداد فوری', hasCarProblem: true, latLng: lastPosition(_lastMapPosition)))),
                //     imagePath: 'assets/images/ic_service_light.png',
                // ),

                //secong design
                _subItemWidget('assets/images/ic_service_light.png', 'امداد فوری', () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SubmitEmdadRequest(title: 'امداد فوری', hasCarProblem: true, latLng: lastPosition(_lastMapPosition))))),

                //first design
                // SizedBox(
                //   width: 135,
                //   child: NeumorphicButton(
                //     onPressed: (){
                //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SubmitEmdadRequest(title: 'امداد فوری', hasCarProblem: true, latLng: _lastMapPosition)));
                //       // _onRequestItemTap();
                //     },
                //     padding: EdgeInsets.symmetric(vertical: defaultPadding,horizontal: 8),
                //     style: NeumorphicStyle(
                //       shape: NeumorphicShape.flat,
                //       boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                //       depth: 8,
                //       lightSource: LightSource.topLeft,
                //       color: Theme.of(context).cardColor,
                //       shadowDarkColor: Theme.of(context).shadowColor,
                //
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text('امداد فوری', style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),),
                //         SizedBox(width: defaultPadding/2,),
                //         Icon(Icons.warning_rounded,color: Theme.of(context).primaryColor)
                //       ],
                //     ),
                //   ),
                // ),


                // CustomItemButton(
                //     title: 'امداد باتری',
                //     onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SubmitEmdadRequest(title: 'امداد باتری', hasCarProblem: false, latLng: lastPosition(_lastMapPosition)))),
                //     imagePath: 'assets/images/ic_service_battery_light.png',
                // )

                //second design
                _subItemWidget('assets/images/ic_service_battery_light.png', 'امداد باتری', () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SubmitEmdadRequest(title: 'امداد باتری', hasCarProblem: false, latLng: lastPosition(_lastMapPosition))))),


                //first design
                // SizedBox(
                //   width: 135,
                //   child: NeumorphicButton(
                //     onPressed: (){
                //       // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SubmitEmdadRequest(title: 'امداد فوری', hasCarProblem: true, latLng: _lastMapPosition)));
                //
                //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SubmitEmdadRequest(title: 'امداد باتری', hasCarProblem: false, latLng: _lastMapPosition)));
                //       // _onRequestItemTap();
                //     },
                //     padding: EdgeInsets.symmetric(vertical: defaultPadding,horizontal: 8),
                //     style: NeumorphicStyle(
                //       shape: NeumorphicShape.flat,
                //       boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                //       depth: 8,
                //       lightSource: LightSource.topLeft,
                //       color: Theme.of(context).cardColor,
                //       shadowDarkColor: Theme.of(context).shadowColor,
                //
                //     ),
                //     child:  Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //
                //       children: [
                //         Text('امداد باتری',textAlign: TextAlign.start, style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
                //         SizedBox(width: defaultPadding/2),
                //         Icon(Icons.home_repair_service_rounded,color: Theme.of(context).primaryColor)
                //       ],
                //     ),
                //   ),
                // ),





              ],
            ),

            SizedBox(height: defaultPadding,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [


                // CustomItemButton(
                //   title: 'امداد پنچری',
                //   onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SubmitEmdadRequest(title: 'امداد پنچری', hasCarProblem: false, latLng: lastPosition(_lastMapPosition)))),
                //   imagePath: 'assets/images/ic_service_flat_tire_light.png',
                // ),

                _subItemWidget('assets/images/ic_service_flat_tire_light.png', 'امداد پنچری', () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SubmitEmdadRequest(title: 'امداد پنچری', hasCarProblem: false, latLng: lastPosition(_lastMapPosition))))),

                // SizedBox(
                //   width: 135,
                //   child: NeumorphicButton(
                //     onPressed: (){
                //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SubmitEmdadRequest(title: 'پنچری لاستیک', hasCarProblem: false, latLng: _lastMapPosition)));
                //
                //       // _onRequestItemTap();
                //     },
                //     padding: EdgeInsets.symmetric(vertical: defaultPadding,horizontal: 8),
                //     style: NeumorphicStyle(
                //       shape: NeumorphicShape.flat,
                //       boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                //       depth: 8,
                //       lightSource: LightSource.topLeft,
                //       color: Theme.of(context).cardColor,
                //       shadowDarkColor: Theme.of(context).shadowColor,
                //
                //     ),
                //     child:  Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text('پنچری لاستیک', style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
                //         SizedBox(width: defaultPadding/2,),
                //         Icon(Icons.airport_shuttle_rounded,color: Theme.of(context).primaryColor)
                //       ],
                //     ),
                //   ),
                // ),


                // CustomItemButton(
                //     title: 'امداد حمل',
                //     onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SubmitEmdadRequest(title: 'امداد حمل', hasCarProblem: false, latLng: lastPosition(_lastMapPosition)))),
                //     imagePath: 'assets/images/ic_service_transport_light.png',
                // )
                _subItemWidget('assets/images/ic_service_transport_light.png', 'امداد حمل', () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SubmitEmdadRequest(title: 'امداد حمل', hasCarProblem: false, latLng: lastPosition(_lastMapPosition))))),


                // SizedBox(
                //   width: 135,
                //   child: NeumorphicButton(
                //     onPressed: (){
                //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SubmitEmdadRequest(title: 'حمل خودرو', hasCarProblem: false, latLng: _lastMapPosition)));
                //
                //       // _onRequestItemTap();
                //     },
                //     padding: EdgeInsets.symmetric(vertical: defaultPadding,horizontal: 8),
                //     style: NeumorphicStyle(
                //       shape: NeumorphicShape.flat,
                //       boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                //       depth: 8,
                //       lightSource: LightSource.topLeft,
                //       color: Theme.of(context).cardColor,
                //       shadowDarkColor: Theme.of(context).shadowColor,
                //
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text('حمل خودرو', style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
                //         SizedBox(width: defaultPadding/2,),
                //         Icon(Icons.car_repair, color: Theme.of(context).primaryColor)
                //       ],
                //     ),
                //   ),
                // ),





              ],
            )





          ],
        )
    );
  }

  Widget _button(String label, IconData icon, Color color) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Icon(
            icon,
            color: Colors.white,
          ),
          decoration:
          BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 8.0,
            )
          ]),
        ),
        SizedBox(
          height: 12.0,
        ),
        Text(label),
      ],
    );
  }

  Widget _body(){
    return Container(
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


          // search bar - current location floating action button
          Column(
            children: [
              SizedBox(
                height: 18,
              ),
              _searchAddressButton(),
              _customFloatingActionButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _searchAddressButton(){

    return InkWell(
      onTap: () async {
        LatLng latLng = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchAddress(userLastLatLng: _center,)));


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


  Widget _subItemWidget(String imagePath, String title, Function() onTap ) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xFFEAEDF3),
            ),
            padding: EdgeInsets.all(12),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              height: 60,
              width: 60,
              // color: Theme.of(context).accentColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Vazir',
                        fontWeight: FontWeight.bold,
                        fontSize: 14))),
          ),
        ],
      ),
    );
  }



}
