import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class MapView extends StatelessWidget {
  // default constructor
  static MapController mapController = MapController.withUserPosition();

  static const _icon = MarkerIcon(
      icon: Icon(
        Icons.location_on,
        color: Colors.blue,
        size: 150,
      ));

      var _staticPoints = [
    StaticPositionGeoPoint('1',  _icon, [GeoPoint(latitude: 42.690755, longitude: 23.3861518)]),
    StaticPositionGeoPoint('2',  _icon, [GeoPoint(latitude: 42.690955, longitude: 23.3751618)]),
    StaticPositionGeoPoint('3',  _icon, [GeoPoint(latitude: 42.6855597, longitude: 23.3909717)]),
    StaticPositionGeoPoint('4',  _icon, [GeoPoint(latitude: 42.660355, longitude: 23.3751818)]),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(
                Icons.checklist,
                size: 30.0,
              ),
              onPressed: () => {context.go('/parkings/list')},
            ),
          )
        ],
      ),
      // body: GoogleMap(
      //   mapType: MapType.normal,
      //   initialCameraPosition: _sofiaAirport,
      //   mapToolbarEnabled: false,
      //   zoomControlsEnabled: false,
      //   // onMapCreated: (GoogleMapController controller) {
      //   //   _controller.complete(controller);
      //   // },
      //   markers: {
      //     const Marker(
      //       markerId: MarkerId('Sofia airport'),
      //       position: LatLng(42.6884635, 23.3774425),
      //     ),
      //     const Marker(
      //       markerId: MarkerId('Sofia airport'),
      //       position: LatLng(42.690755, 23.3751518),
      //     )
      //   },
      // ),
      body: Stack(children: [
        OSMFlutter(
            controller: mapController,
            initZoom: 12,
            trackMyPosition: true,
            staticPoints: _staticPoints,
            onMapIsReady: _addMarkers,
        onGeoPointClicked: (geoPoint){
              var foundPoint = _staticPoints.singleWhere((element) =>
                element.geoPoints?[0].latitude == geoPoint.latitude && element.geoPoints?[0].longitude == geoPoint.longitude
              );

              context.go('/parkings/${foundPoint.id}');
        },),
      ]),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await mapController.currentLocation();

          log('go to my location');

          //context.go('/parkings/list');
        },
        child: Icon(Icons.pin_drop),
      ),
    );
  }

  _addMarkers(bool) async {
    // await mapController.addMarker(
    //     GeoPoint(latitude: 42.690755, longitude: 23.3751518),
    //     angle: math.pi / 3);
  //   await mapController.addMarker(
  //       GeoPoint(latitude: 42.690755, longitude: 23.3751518),
  //       angle: math.pi / 3);
  }
}
