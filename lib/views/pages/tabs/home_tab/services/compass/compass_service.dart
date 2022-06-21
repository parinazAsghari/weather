import 'package:emdad_khodro_saipa/views/widgets/custom_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;
import 'package:permission_handler/permission_handler.dart';

class Compass extends StatefulWidget {
  const Compass({Key? key}) : super(key: key);

  @override
  State<Compass> createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  bool _hasPermissions = false;
  CompassEvent? _lastRead;
  DateTime? _lastReadAt;

  @override
  void initState() {
    super.initState();

    _fetchPermissionStatus();
    // Permission.locationWhenInUse.request().then((ignored) {
    //   _fetchPermissionStatus();
    // });
    // _fetchPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          'قطب نما',
          // style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        // backgroundColor: secondary_dark_purple_color,
      ),
      body: _body(),
    );
  }
  Widget _body() {
    return Builder(builder: (context) {
      if (_hasPermissions) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // _buildManualReader(),
            _buildCompass(),
          ],
        );
      } else {
        return _buildPermissionSheet();
      }
    });
  }


  Widget _buildManualReader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          ElevatedButton(
            child: Text('Read Value'),
            onPressed: () async {
              final CompassEvent tmp = await FlutterCompass.events!.first;
              setState(() {
                _lastRead = tmp;
                _lastReadAt = DateTime.now();
              });
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$_lastRead',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    '$_lastReadAt',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompass() {
    return StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error reading heading: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        double? direction = snapshot.data!.heading;

        // if direction is null, then device does not support this sensor
        // show error message
        if (direction == null)
          return Center(
            child: Text("دستگاه شما این قابلیت را پشتیبانی نمی کند"),
          );

        return Container(
          margin: EdgeInsets.all(32),
          child: Material(
            shape: CircleBorder(),
            clipBehavior: Clip.antiAlias,
            elevation: 4.0,
            child: Container(
              padding: EdgeInsets.all(25.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor

              ),
              child: Transform.rotate(
                angle: (direction * (math.pi / 180) * -1),
                child: Image.asset('assets/images/compass.png'),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPermissionSheet() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('دسترسی به مکان یاب دستگاه مورد نیاز است',style: TextStyle(color: Theme.of(context).primaryColorLight),),

          SizedBox(height: 16),

          CustomSubmitButton(
              onTap: (){
                Permission.locationWhenInUse.request().then((ignored) {
                  _fetchPermissionStatus();
                });
              },
              text: 'اجازه دسترسی'
          ),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     primary: Theme.of(context).accentColor
          //   ),
          //   child: Text('Request Permissions'),
          //   onPressed: () {
          //     Permission.locationWhenInUse.request().then((ignored) {
          //       _fetchPermissionStatus();
          //     });
          //   },
          // ),
          // SizedBox(height: 16),
          // ElevatedButton(
          //   child: Text('Open App Settings'),
          //   onPressed: () {
          //     openAppSettings().then((opened) {
          //       //
          //     });
          //   },
          // )
        ],
      ),
    );
  }

  void _fetchPermissionStatus() {
    Permission.locationWhenInUse.status.then((status) {
      if (mounted) {
        setState(() => _hasPermissions = status == PermissionStatus.granted);
      }
    });
  }





}


