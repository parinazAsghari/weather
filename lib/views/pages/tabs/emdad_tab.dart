import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../constants.dart';
import '../../widgets/DialogWidgets.dart';
import '../../widgets/LoadingWidgets.dart';


class EmdadTab extends StatefulWidget {
  const EmdadTab({Key? key}) : super(key: key);

  @override
  _EmdadTabState createState() => _EmdadTabState();
}

class _EmdadTabState extends State<EmdadTab> {


  //map
  GoogleMapController? _controller;
  static const LatLng _center = const LatLng(35.748, 51.328);
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  BitmapDescriptor? customIcon;
  LatLng _lastMapPosition = _center;



  //sliding up panel
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 300;
  double _panelHeightClosed = 80.0;
  PanelController _panelController = PanelController();

  int requestState = 0;







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

      _panelController.open();

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
                    backgroundColor: color_sharp_orange_low,
                    child:  Icon(Icons.location_on_rounded,
                        color: color_holoGrey_primaryLight,
                        size: 36.0),
                  ),

                  SizedBox(height: defaultPadding,),

                  FloatingActionButton(
                    onPressed: () {
                      _panelController.open();
                    },
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
                      color: Colors.grey[300],
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
                  color: color_holoGrey_primaryDark
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
                      color: color_holoGrey_primaryLight
                    ),
                    child: Center(child: Text(' حمل خودرو')),
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
                      color: color_holoGrey_primaryLight
                    ),
                    child: Center(child: Text('خدمات در محل',textAlign: TextAlign.center,)),
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
                      color: color_holoGrey_primaryLight
                    ),
                    child: Center(child: Text('پنچری')),
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
                      color: color_holoGrey_primaryLight
                    ),
                    child: Center(child: Text('بنزین')),
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
    return GoogleMap(
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
    );
  }


}
