import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../assit/location_const.dart';
import '../assit/header_image.dart';
import '../assit/constant.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  Completer<GoogleMapController> _controller =Completer();
  final List<Marker> _markers = [];
  static final CameraPosition _klebanon = CameraPosition(
      target: LatLng(33.888630, 35.495480),
      zoom: 8);
  static final CameraPosition _kBeirut =CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(33.888630, 35.495480),
      tilt: 59.440717697143555,
      zoom: 12);
  static final CameraPosition _kBikaa =CameraPosition(
    //bearing: 192.8334901395799,
      target: LatLng(33.803054, 35.866430),
      tilt: 59.440717697143555,
      zoom: 10);
  static final CameraPosition _kSouth =CameraPosition(
    //bearing: 192.8334901395799,
      target: LatLng(33.561212, 35.372805),
      tilt: 59.440717697143555,
      zoom: 10);
  static final CameraPosition _kNorth =CameraPosition(
    //bearing: 192.8334901395799,
      target: LatLng(34.434935, 35.836171),
      tilt: 59.440717697143555,
      zoom: 10);
  void _onMapCreated(GoogleMapController controller) {_controller.complete(controller);}
  int k=0;
  void initState() {
    // TODO: implement initState
    super.initState();
    for (LatLng markerLocation in markerLocations) {

      if(k < branchname.length){
        _markers.add(Marker(
          markerId: MarkerId(markerLocations.indexOf(markerLocation).toString()),
          //position: LatLng(33.874052, 35.496465),
          position: markerLocation,
          draggable: false,
          infoWindow: InfoWindow(title: branchname[k], snippet: snippet[k]),
        ),);
        k++;
      }
    }
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: HeaderImage(),
            backgroundColor: Colors.white,
            leading: new IconButton(
                icon: new Icon(Icons.arrow_back),
                color: Color(0XFF3f51b5),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          body: Column(
            children: <Widget>[
              Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  initialCameraPosition: _klebanon,
                  onMapCreated: _onMapCreated,
                  markers: Set.from(_markers),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: _goToAll,
                    child: Text('جميع الفروع',style:kLabelMapTextStyle ,),
                  ),
                  FlatButton(
                    onPressed: _goToBeirut,
                    child: Text('بيروت',style:kLabelMapTextStyle ,),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: _goToSouth,
                    child: Text('الجنوب',style:kLabelMapTextStyle ,),
                  ),
                  FlatButton(
                    onPressed: _goToNorth,
                    child: Text('الشمال',style:kLabelMapTextStyle ,),
                  ),
                  FlatButton(
                    onPressed: _goToBikaa,
                    child: Text('البقاع',style:kLabelMapTextStyle ,),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _goToBeirut() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kBeirut));
  }

  Future<void> _goToAll() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_klebanon));
  }

  Future<void> _goToBikaa() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kBikaa));
  }

  Future<void> _goToSouth() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kSouth));
  }

  Future<void> _goToNorth() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kNorth));
  }
}
