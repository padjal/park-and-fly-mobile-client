import 'dart:async';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapView extends StatelessWidget {
  // final Completer<GoogleMapController> _controller =
  //     Completer<GoogleMapController>();

  static const CameraPosition _sofiaAirport = CameraPosition(
    target: LatLng(42.6884635, 23.3774425),
    zoom: 14.4746,
  );

  // default constructor
  MapController mapController = MapController.withUserPosition(
  );

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
      body: Stack(
        children: [
          OSMFlutter(
            controller:mapController,
            initZoom: 12,
            trackMyPosition: true,
          ),
        ]
      ),

        floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await mapController.currentLocation();

          //context.go('/parkings/list');
        },
        child: Icon(Icons.pin_drop),
      ),
    );
  }
}
