import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_health/custom_widgets/appbar.dart';
import 'package:smart_health/custom_widgets/drawer.dart';
import 'package:smart_health/custom_widgets/emergency_float_button.dart';
import 'package:smart_health/models/routes.dart';

class RoutesPage extends StatefulWidget {
  RoutesPage({Key key}) : super(key: key);

  @override
  _RoutesPageState createState() => _RoutesPageState();
}

class _RoutesPageState extends State<RoutesPage> {
  // Location fields
  CameraPosition _currentPosition;
  bool _serviceEnabled;
  LocationPermission _permission;

  @override
  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  // Google Map fields
  GoogleMapController _mapController;
  Set<Marker> currentLocationMarker = Set<Marker>();
  Set<Marker> newRouteMarker = Set<Marker>();
  MarkerId selectedMarker;
  bool _enableTap = false;
  PolylinePoints polylinePoints;
  List<LatLng> polylineCoordinates = [];
  Map<PolylineId, Polyline> polylines = {};

  List<GoogleRoute> routes = new List<GoogleRoute>();

  static final CameraPosition _homePosition = CameraPosition(
      target: LatLng(43.33160566750162, 21.892302632331848), zoom: 18.0);

  _changeCameraPosition(CameraPosition newPosition) {
    _mapController.animateCamera(CameraUpdate.newCameraPosition(newPosition));
  }

  _checkIfLocationServiceIsEnabled() async {
    _serviceEnabled = await isLocationServiceEnabled();
    if (!_serviceEnabled) {
      return;
    }

    _permission = await checkPermission();
    if (_permission == LocationPermission.denied) {
      _permission = await requestPermission();
      if (_permission != LocationPermission.always ||
          _permission != LocationPermission.whileInUse) {
        return;
      }
    }
  }

  _getUserLocation() {
    getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _currentPosition = new CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 18.0);

        _addMarker(position.latitude, position.longitude);
        _changeCameraPosition(_currentPosition);
      });
    });
  }

  _showCurrentLocation() async {
    _changeCameraPosition(_currentPosition);
    _addMarker(
        _currentPosition.target.latitude, _currentPosition.target.longitude);
  }

  _addMarker(double latitude, double longitude) {
    if (_enableTap) {
      final MarkerId markerId = MarkerId('marker_destination_location');

      final Marker marker = Marker(
          draggable: true,
          markerId: markerId,
          position: LatLng(latitude, longitude));

      setState(() {
        newRouteMarker.add(marker);
      });
    } else {
      final MarkerId markerId = MarkerId('marker_current_location');

      final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(title: 'Current Location'),
      );

      setState(() {
        currentLocationMarker.add(marker);
      });
    }
  }

  _addNewRoute(BuildContext context) {
    showInputDialog(context).then((value) {
      routes.add(new GoogleRoute(
          icon: Icons.store,
          name: value,
          distance: double.parse(distanceBetween(_currentPosition.target.latitude, _currentPosition.target.longitude, newRouteMarker.first.position.latitude, newRouteMarker.first.position.longitude).toStringAsFixed(0)),
          marker: newRouteMarker.first));

      setState(() {
        _enableTap = false;
        newRouteMarker.clear();
      });
    });
  }

  _handleTap(LatLng point) {
    if (_enableTap) {
      setState(() {
        currentLocationMarker.clear();
        _addMarker(point.latitude, point.longitude);
      });
    }
  }

  _createPolylines(Position start, Position destination) async {
    // Initializing PolylinePoints
    polylinePoints = PolylinePoints();

    // Generating the list of coordinates to be used for
    // drawing the polylines
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyBF3S0aJL_UmHFxLuwChpbnJRGc3yBv8Vw",
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.transit,
    );

    // Adding the coordinates to the list
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    // Defining an ID
    PolylineId id = PolylineId('poly');

    // Initializing Polyline
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );

    // Adding the polyline to the map
    polylines[id] = polyline;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: EmergencyFloatButton(),
          appBar: CustomAppBar(),
          drawer: CustomDrawer(),
          body: Stack(
            children: [
              GoogleMap(
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                initialCameraPosition:
                    _currentPosition == null ? _homePosition : _currentPosition,
                onMapCreated: (GoogleMapController controller) {
                  _mapController = controller;
                },
                markers: _enableTap ? newRouteMarker : currentLocationMarker,
                polylines: Set<Polyline>.of(polylines.values),
                onTap: _handleTap,
              ),
              Positioned(
                bottom: 180,
                left: -5,
                child: MaterialButton(
                  color: Colors.blue,
                  shape: CircleBorder(),
                  height: 55,
                  child: Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                    _changeCameraPosition(_homePosition);
                  },
                ),
              ),
              Positioned(
                bottom: 110,
                left: -5,
                child: MaterialButton(
                  color: Colors.blue,
                  shape: CircleBorder(),
                  height: 55,
                  child: Icon(Icons.my_location, color: Colors.white),
                  onPressed: () {
                    _showCurrentLocation();
                  },
                ),
              ),
              Visibility(
                visible: _enableTap,
                child: Positioned(
                  bottom: 40,
                  left: 60,
                  child: MaterialButton(
                    color: Colors.green,
                    shape: CircleBorder(),
                    height: 55,
                    child: Icon(Icons.check, color: Colors.white),
                    onPressed: () {
                      _addNewRoute(context);
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 40,
                left: -5,
                child: MaterialButton(
                  color: Colors.blue,
                  shape: CircleBorder(),
                  height: 55,
                  child: Icon(Icons.map, color: Colors.white),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MaterialButton(
                                      shape: CircleBorder(),
                                      child:
                                          Icon(Icons.add, color: Colors.white),
                                      color: Colors.green,
                                      onPressed: () {
                                        Navigator.pop(context);
                                        setState(() {
                                          _enableTap = true;
                                        });
                                      },
                                    )
                                  ],
                                ),
                                Divider(),
                                ..._buildListTiles(context)
                              ],
                            ));
                  },
                ),
              ),
            ],
          )),
    );
  }

  List<Widget> _buildListTiles(BuildContext context) {
    List<Widget> listTiles = new List<Widget>();

    routes.forEach((element) {
      listTiles.add(new ListTile(
        leading: Icon(element.icon),
        title: Text(element.name),
        subtitle: Text("Distance: ${element.distance}m"),
        trailing: FlatButton(
          child: Icon(Icons.delete),
          onPressed: () {},
        ),
        onTap: () {
          Widget yesButton = FlatButton(
            child: Text("Yes"),
            onPressed: () {
              polylineCoordinates.clear();
              _createPolylines(new Position(latitude: _currentPosition.target.latitude, longitude: _currentPosition.target.longitude), new Position(latitude: element.marker.position.latitude, longitude: element.marker.position.longitude));
              Navigator.pop(context);
            },
          );
          showYesNoDialog(context, yesButton);
        },
      ));
    });

    return listTiles;
  }

  showYesNoDialog(BuildContext context, Widget yesButton) {
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Start the route"),
      content: Text("Are you sure that you want to start this route?"),
      actions: [cancelButton, yesButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<String> showInputDialog(BuildContext context) {
    TextEditingController inputController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Name your new route"),
          content: TextField(controller: inputController),
          actions: [
            FlatButton(
              child: Text("Save"),
              onPressed: () {
                Navigator.pop(context, inputController.text);
              },
            )
          ],
        );
      },
    );
  }
}
