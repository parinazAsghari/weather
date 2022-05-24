import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapir_raster/mapir_raster.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:flutter_map/flutter_map.dart' as flutterMap;


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

  flutterMap.MapController _mapController = flutterMap.MapController();

  @override
  void initState() {
    super.initState();
    // make sure to initialize before map loading

    // markerLoadings();

    _fabHeight = _initFabHeight;

  }


  // void markerLoadings()async{
  //   final Uint8List markerIcon = await getBytesFromAsset('assets/images/car.png', 100);
  //   // final Marker marker = Marker(icon: BitmapDescriptor.fromBytes(markerIcon));
  //
  //   setState(() {
  //     customIcon = BitmapDescriptor.fromBytes(markerIcon);
  //   });
  // }



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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                      // color: primary_orange_color,
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
              ],
            ),
            SizedBox(
              height: 18.0,
            ),



            Container(
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

            SizedBox(
              height: 24,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    _onRequestItemTap();
                  },
                  child: Container(
                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      // color: secondary_light_grey_color
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('حمل خودرو', style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                        Icon(Icons.warning_rounded)
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){
                    _onRequestItemTap();

                  },
                  child: Container(
                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      // color: secondary_light_grey_color
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Text('خدمات در محل',textAlign: TextAlign.center, style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                        Icon(Icons.home_repair_service_rounded)
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
                InkWell(
                  onTap: (){
                    _onRequestItemTap();

                  },
                  child: Container(

                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      // color: secondary_light_grey_color
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('پنچری', style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                        Icon(Icons.airport_shuttle_rounded)
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){
                    _onRequestItemTap();

                  },
                  child: Container(

                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      // color: secondary_light_grey_color
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('بنزین', style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                        Icon(Icons.local_gas_station_rounded, )
                      ],
                    ),
                  ),
                ),



              ],
            )





          ],
        ));
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

      child: MapirMap(
        apiKey: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjQxZmNiZjFjMzZkMWQ2ODY2Y2VmZDg5ZDcyYjkzOWNlOWU3N2FlZGFmOTZkYzVhMGU3Mjk4YTdmMTUwOTY3ZjNlOTQxYmMxYTE1ZWFiNmQwIn0.eyJhdWQiOiIxODA2MSIsImp0aSI6IjQxZmNiZjFjMzZkMWQ2ODY2Y2VmZDg5ZDcyYjkzOWNlOWU3N2FlZGFmOTZkYzVhMGU3Mjk4YTdmMTUwOTY3ZjNlOTQxYmMxYTE1ZWFiNmQwIiwiaWF0IjoxNjUzMzg3MDkxLCJuYmYiOjE2NTMzODcwOTEsImV4cCI6MTY1NTk3OTA5MSwic3ViIjoiIiwic2NvcGVzIjpbImJhc2ljIl19.jDw7w-nTooFaIOmB5ufzDhGu5ESYzD_jUDkvfHh6HunR8Jk3dORUXoHwFw54vCZW4OS9Vrnyv5M1Qd-VJZ9KgMboM_vx5R3bzOCnsCr9IKZ7k3J_EXZzQgYdf1m9G0TNijr5Y9mIWKZPVyt-FODyeg0BzjS-YaxYKLioy0LzUUzDG4OgA9bn-MvlbmZA2zTwwqCpjF89DwUuCkghtehrPtW_VSn_sJ4y6dhcngDiW6hJmD8HGFmOGH1WDp31aZxukkp3QYEl0fihhh23vgU7ll7Oiz4pTztLoErOd_6QL7xxmGjaTcsh8L8os3lz-h34GqOlREozkyTVp6V4pgcMlA',
        options: flutterMap.MapOptions(
          center: latlng.LatLng(35.7324556, 51.4229012),
          zoom: 16.0,
        ),
        mapController: _mapController,

        layers: [
          flutterMap.MarkerLayerOptions(
            markers: [
              flutterMap.Marker(
                width: 80.0,
                height: 80.0,
                point: latlng.LatLng(35.7324556, 51.4229012),
                builder: (ctx) => const FlutterLogo(),
              ),
            ],
          ),
        ],
      ),

      /*
      child: GoogleMap(
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

       */
    );
  }


}
