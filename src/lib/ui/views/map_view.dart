import 'dart:async';
import 'dart:developer';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class MapView extends StatelessWidget {
  // default constructor
  static MapController mapController = MapController.withUserPosition(
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

          log('go to my location');

          //context.go('/parkings/list');
        },
        child: Icon(Icons.pin_drop),
      ),
    );
  }
}
