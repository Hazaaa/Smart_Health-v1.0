import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:smart_health/custom_widgets/appbar.dart';
import 'package:smart_health/custom_widgets/drawer.dart';
import 'package:smart_health/custom_widgets/emergency_float_button.dart';

class RoutesPage extends StatefulWidget {
  RoutesPage({Key key}) : super(key: key);

  @override
  _RoutesPageState createState() => _RoutesPageState();
}

class _RoutesPageState extends State<RoutesPage> {
  // Location fields
  Location _myLocation = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  CameraPosition _currentPosition;

  // Google Map fields
  GoogleMapController _mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId selectedMarker;
  int _markerIdCounter = 1;

  static final CameraPosition _homePosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.4746);

  _changeCameraPosition(CameraPosition newPosition) {
    _mapController.animateCamera(CameraUpdate.newCameraPosition(newPosition));
  }

  _checkIfLocationServiceIsEnabled() async {
    _serviceEnabled = await _myLocation.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _myLocation.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _myLocation.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _myLocation.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  _getMyLocation() async {
    await _checkIfLocationServiceIsEnabled();

    _locationData = await _myLocation.getLocation();

    _currentPosition = CameraPosition(
        target: LatLng(_locationData.latitude, _locationData.longitude),
        zoom: 14.4746);
  }

  _showCurrentLocation() async {
    _getMyLocation();
    _changeCameraPosition(_currentPosition);
    _addMarker(
        _currentPosition.target.latitude, _currentPosition.target.longitude);
  }

  _addMarker(double latitude, double longitude) {
    final int markerCount = markers.length;

    if (markerCount == 12) {
      return;
    }

    final String markerIdVal = 'marker_id_current_location';
    _markerIdCounter = _markerIdCounter+1;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(latitude, longitude),
      infoWindow: InfoWindow(title: 'Current Location'),
    );

    setState(() {
      markers[markerId] = marker;
    });
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
                initialCameraPosition: _homePosition,
                onMapCreated: (GoogleMapController controller) {
                  _mapController = controller;
                },
                markers: Set<Marker>.of(markers.values),
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
              Positioned(
                bottom: 180,
                left: -5,
                child: MaterialButton(
                  color: Colors.blue,
                  shape: CircleBorder(),
                  height: 55,
                  child: Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                    // TODO: Add bottom sheet to appear
                  },
                ),
              ),
            ],
          )),
    );
  }
}
