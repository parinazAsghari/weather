import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:emdad_khodro_saipa/api_provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapir_raster/mapir_raster.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:flutter_map/flutter_map.dart' as flutterMap;
import 'package:flutter/foundation.dart' show kIsWeb;


import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../constants.dart';
import '../../widgets/DialogWidgets.dart';
import '../../widgets/LoadingWidgets.dart';
import 'package:location/location.dart';


class EmdadTab extends StatefulWidget {
  const EmdadTab({Key? key}) : super(key: key);

  @override
  _EmdadTabState createState() => _EmdadTabState();
}

class _EmdadTabState extends State<EmdadTab> {


  //map
  GoogleMapController? _controller;
  static  LatLng _center = const LatLng(35.748, 51.328);
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  BitmapDescriptor? customIcon;
  LatLng _lastMapPosition = _center;

  List<Marker> markersList = [];



  //sliding up panel
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 300;
  double _panelHeightClosed = 80.0;
  PanelController _panelController = PanelController();

  Location currentLocation = Location();

  int requestState = 0;


 // map.ir map

  flutterMap.MapController _mapController = flutterMap.MapController();
  var pos =  latlng.LatLng(35.748, 51.328);
  flutterMap.Marker _mapMarker = flutterMap.Marker(
    point: latlng.LatLng(35.748, 51.328),
    builder: (ctx) {
      return Container(
        child: Icon(Icons.location_on_rounded, size: 40),
      );
    },
  );

  void callApi(LatLng latLng)async{


    var result = await ApiProvider.getAddress(latLng);

    print(result.addressCompact);


  }
  
  
  
  
  @override
  void initState() {
    super.initState();
    // make sure to initialize before map loading

    // markerLoadings();

    _fabHeight = _initFabHeight;
    
    
    // callApi(_center);


  }
  
 


  void markerLoadings()async{
    final Uint8List markerIcon = await getBytesFromAsset('assets/images/car.png', 100);
    // final Marker marker = Marker(icon: BitmapDescriptor.fromBytes(markerIcon));

    setState(() {
      customIcon = BitmapDescriptor.fromBytes(markerIcon);
    });
  }


  void _onFlutterMapCreated(flutterMap.MapController mapController){


  }

  void _onFlutterMaoPositionChanged(flutterMap.MapPosition position, bool status){

    if(status){

      setState(() {
        pos = position.center!;

        _mapMarker = flutterMap.Marker(
          point: position.center!,
          builder: (ctx) {
            return Container(
              child: Icon(Icons.location_on_rounded, size: 40),
            );
          },
        );
      });
      setState(() {

      });
    }

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

  //sliding up panel methods
  _onRequestItemTap() async {

    showDialog(context: context, builder: (BuildContext context){
      return CircleLoadingWidget(
        dismissable: false,
        msgTxt: 'لطفا منتظر بمانید',
      );
    });

    await Future.delayed(Duration(milliseconds: 4000));

    Navigator.pop(context);

    showDialog(context: context, builder: (BuildContext context){

      return MessageDialogWidget(
        dismissable: true,
        title: 'درخواست ثبت شد',
        body:  'درخواست شما با موفقیت ثبت شد. همکاران ما بزودی با شما تماس خواهند گرفت',
        positiveTxt: 'باشه',
      );
    });


    _panelController.close();
    setState(() {

    });

  }

  void getLocation() async{
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc){

      _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
        zoom: 12.0,
      )));

      print(loc.latitude);
      print(loc.longitude);
      setState(() {

      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [

          SlidingUpPanel(
            controller: _panelController,
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            defaultPanelState: PanelState.CLOSED,

            // parallaxOffset: .5,
            // color: primary_grey_color,
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





          // map

          // GoogleMap(
          //   onMapCreated: _onMapCreated,
          //   initialCameraPosition: CameraPosition(
          //     target: _center,
          //     zoom: 17.0,
          //
          //   ),
          //   onCameraMove: _onCameraMove,
          //   markers: markers.values.toSet(),
          //   myLocationEnabled: true,
          //   myLocationButtonEnabled: true,
          //
          //   zoomControlsEnabled: true,
          //   zoomGesturesEnabled: true,
          // ),


          //fab buttons - top right
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
                    // backgroundColor: secondary_dark_purple_color,
                    child:  Icon(Icons.location_on_rounded,
                        // color: secondary_light_purple_color,
                        size: 20.0),
                  ),

                  SizedBox(height: defaultPadding,),

                  FloatingActionButton(
                    onPressed: () {
                      _panelController.isPanelClosed? _panelController.open() : _panelController.close();
                    },
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    // backgroundColor: secondary_dark_purple_color,
                    child:  Icon(Icons.add_box_rounded,
                        // color: secondary_light_purple_color,
                        size: 20.0),
                  ),
                ],
              ),
            ),
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


            Center(
              child: Container(
                width: 30,
                height: 8,
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ),

            SizedBox(
              height: 18.0,
            ),

            Container(
              child: InkWell(
                onTap: (){
                  _panelController.open();
                },
                child: Text(
                  'ثبت درخواست',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    // color: secondary_light_grey_color,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 24,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 135,
                  child: NeumorphicButton(
                    onPressed: (){
                      _onRequestItemTap();
                    },
                    padding: EdgeInsets.symmetric(vertical: defaultPadding,horizontal: 8),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                      // depth: 8,
                      lightSource: LightSource.topLeft,
                      color: Theme.of(context).cardColor,
                      shadowDarkColor: Theme.of(context).shadowColor,

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('حمل خودرو', style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),),
                        SizedBox(width: defaultPadding,),
                        Icon(Icons.warning_rounded,color: Theme.of(context).primaryColor)
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 135,
                  child: NeumorphicButton(
                    onPressed: (){
                      _onRequestItemTap();
                    },
                    padding: EdgeInsets.symmetric(vertical: defaultPadding,horizontal: 8),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                      // depth: 8,
                      lightSource: LightSource.topLeft,
                      color: Theme.of(context).cardColor,
                      shadowDarkColor: Theme.of(context).shadowColor,

                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Text('خدمات در محل',textAlign: TextAlign.center, style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
                        SizedBox(width: defaultPadding,),
                        Icon(Icons.home_repair_service_rounded,color: Theme.of(context).primaryColor)
                      ],
                    ),
                  ),
                ),




              ],
            ),

            SizedBox(height: defaultPadding,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 135,
                  child: NeumorphicButton(
                    onPressed: (){
                      _onRequestItemTap();
                    },
                    padding: EdgeInsets.symmetric(vertical: defaultPadding,horizontal: 8),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                      // depth: 8,
                      lightSource: LightSource.topLeft,
                      color: Theme.of(context).cardColor,
                      shadowDarkColor: Theme.of(context).shadowColor,

                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('پنچری لاستیک', style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
                        SizedBox(width: defaultPadding,),
                        Icon(Icons.airport_shuttle_rounded,color: Theme.of(context).primaryColor)
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 135,
                  child: NeumorphicButton(
                    onPressed: (){
                      _onRequestItemTap();
                    },
                    padding: EdgeInsets.symmetric(vertical: defaultPadding,horizontal: 8),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                      // depth: 8,
                      lightSource: LightSource.topLeft,
                      color: Theme.of(context).cardColor,
                      shadowDarkColor: Theme.of(context).shadowColor,

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('اتمام سوخت', style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
                        SizedBox(width: defaultPadding,),
                        Icon(Icons.local_gas_station_rounded, color: Theme.of(context).primaryColor)
                      ],
                    ),
                  ),
                ),




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
      // color: primary_grey_color,


      //map.ir - map
      /*
      child: Stack(

        children: [

          MapirMap(
            apiKey: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjQxZmNiZjFjMzZkMWQ2ODY2Y2VmZDg5ZDcyYjkzOWNlOWU3N2FlZGFmOTZkYzVhMGU3Mjk4YTdmMTUwOTY3ZjNlOTQxYmMxYTE1ZWFiNmQwIn0.eyJhdWQiOiIxODA2MSIsImp0aSI6IjQxZmNiZjFjMzZkMWQ2ODY2Y2VmZDg5ZDcyYjkzOWNlOWU3N2FlZGFmOTZkYzVhMGU3Mjk4YTdmMTUwOTY3ZjNlOTQxYmMxYTE1ZWFiNmQwIiwiaWF0IjoxNjUzMzg3MDkxLCJuYmYiOjE2NTMzODcwOTEsImV4cCI6MTY1NTk3OTA5MSwic3ViIjoiIiwic2NvcGVzIjpbImJhc2ljIl19.jDw7w-nTooFaIOmB5ufzDhGu5ESYzD_jUDkvfHh6HunR8Jk3dORUXoHwFw54vCZW4OS9Vrnyv5M1Qd-VJZ9KgMboM_vx5R3bzOCnsCr9IKZ7k3J_EXZzQgYdf1m9G0TNijr5Y9mIWKZPVyt-FODyeg0BzjS-YaxYKLioy0LzUUzDG4OgA9bn-MvlbmZA2zTwwqCpjF89DwUuCkghtehrPtW_VSn_sJ4y6dhcngDiW6hJmD8HGFmOGH1WDp31aZxukkp3QYEl0fihhh23vgU7ll7Oiz4pTztLoErOd_6QL7xxmGjaTcsh8L8os3lz-h34GqOlREozkyTVp6V4pgcMlA',
            options: flutterMap.MapOptions(
              onMapCreated: _onFlutterMapCreated,
              controller: _mapController,
              onPositionChanged: _onFlutterMaoPositionChanged,
              center: pos,
              zoom: 16.0,
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
                    _panelController.open();
                  },
                  child: Icon(Icons.location_on_rounded,size: 50,
                  color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: defaultPadding*6,)
              ],
            ),
          ),
        ],
      ),


       */



      child: kIsWeb?
      //PWA - map.ir map
      Stack(

        children: [

          MapirMap(
            apiKey: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjQxZmNiZjFjMzZkMWQ2ODY2Y2VmZDg5ZDcyYjkzOWNlOWU3N2FlZGFmOTZkYzVhMGU3Mjk4YTdmMTUwOTY3ZjNlOTQxYmMxYTE1ZWFiNmQwIn0.eyJhdWQiOiIxODA2MSIsImp0aSI6IjQxZmNiZjFjMzZkMWQ2ODY2Y2VmZDg5ZDcyYjkzOWNlOWU3N2FlZGFmOTZkYzVhMGU3Mjk4YTdmMTUwOTY3ZjNlOTQxYmMxYTE1ZWFiNmQwIiwiaWF0IjoxNjUzMzg3MDkxLCJuYmYiOjE2NTMzODcwOTEsImV4cCI6MTY1NTk3OTA5MSwic3ViIjoiIiwic2NvcGVzIjpbImJhc2ljIl19.jDw7w-nTooFaIOmB5ufzDhGu5ESYzD_jUDkvfHh6HunR8Jk3dORUXoHwFw54vCZW4OS9Vrnyv5M1Qd-VJZ9KgMboM_vx5R3bzOCnsCr9IKZ7k3J_EXZzQgYdf1m9G0TNijr5Y9mIWKZPVyt-FODyeg0BzjS-YaxYKLioy0LzUUzDG4OgA9bn-MvlbmZA2zTwwqCpjF89DwUuCkghtehrPtW_VSn_sJ4y6dhcngDiW6hJmD8HGFmOGH1WDp31aZxukkp3QYEl0fihhh23vgU7ll7Oiz4pTztLoErOd_6QL7xxmGjaTcsh8L8os3lz-h34GqOlREozkyTVp6V4pgcMlA',
            options: flutterMap.MapOptions(
              onMapCreated: _onFlutterMapCreated,
              controller: _mapController,
              onPositionChanged: _onFlutterMaoPositionChanged,
              center: pos,
              zoom: 16.0,
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
                    _panelController.open();
                  },
                  child: Icon(Icons.location_on_rounded,size: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: defaultPadding*6,)
              ],
            ),
          ),
        ],
      )
      :
      //mobile app - android yet    
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





    );
  }


}
