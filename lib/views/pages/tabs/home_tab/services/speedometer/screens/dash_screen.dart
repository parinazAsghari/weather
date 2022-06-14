import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/speedometer.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({this.unit = 'm/s', Key? key}) : super(key: key);

  final String unit;

  @override
  _DashScreenState createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  SharedPreferences? _sharedPreferences;

  /// Create a stream trying to speak speed
  StreamSubscription? _ttsCallback;



  /// Utility function to deserialize saved Duration
  Duration _secondsToDuration(int seconds) {
    int minutes = (seconds / 60).floor();
    return Duration(minutes: minutes, seconds: seconds % 60);
  }

  // For velocity Tracking
  /// Geolocator is used to find velocity
  GeolocatorPlatform locator = GeolocatorPlatform.instance;

  /// Stream that emits values when velocity updates
  late StreamController<double?> _velocityUpdatedStreamController;

  /// Current Velocity in m/s
  double? _velocity;

  /// Highest recorded velocity so far in m/s.
  double? _highestVelocity;

  /// Velocity in m/s to km/hr converter
  double mpstokmph(double mps) => mps * 18 / 5;

  /// Velocity in m/s to miles per hour converter
  double mpstomilesph(double mps) => mps * 85 / 38;

  /// Relevant velocity in chosen unit
  double? convertedVelocity(double? velocity) {
    velocity = velocity ?? _velocity;

    if (widget.unit == 'm/s') {
      return velocity;
    } else if (widget.unit == 'km/h') {
      return mpstokmph(velocity!);
    } else if (widget.unit == 'miles/h') {
      return mpstomilesph(velocity!);
    }
    return velocity;
  }

  @override
  void initState() {
    super.initState();
    // Speedometer functionality. Updates any time velocity chages.
    _velocityUpdatedStreamController = StreamController<double?>();
    locator
        .getPositionStream(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.bestForNavigation,
          ),
        )
        .listen(
          (Position position) => _onAccelerate(position.speed),
        );

    // Set velocities to zero when app opens
    _velocity = 0;
    _highestVelocity = 0.0;

  }

  /// Callback that runs when velocity updates, which in turn updates stream.
  void _onAccelerate(double speed) {
    locator.getCurrentPosition().then(
      (Position updatedPosition) {
        print('this is current location ===>>>>>> ${updatedPosition}');

        _velocity = (speed + updatedPosition.speed) / 2;
        if (_velocity! > _highestVelocity!) _highestVelocity = _velocity;
        _velocityUpdatedStreamController.add(_velocity);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const double gaugeBegin = 0, gaugeEnd = 200;

    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // StreamBuilder updates Speedometer when new velocity recieved
          StreamBuilder<Object?>(
            stream: _velocityUpdatedStreamController.stream,
            builder: (context, snapshot) {
              return Speedometer(
                gaugeBegin: gaugeBegin,
                gaugeEnd: gaugeEnd,
                velocity: convertedVelocity(_velocity),
                maxVelocity: convertedVelocity(_highestVelocity),
                velocityUnit: widget.unit,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Velocity Stream
    _velocityUpdatedStreamController.close();
    super.dispose();
  }
}
