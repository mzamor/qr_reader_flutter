import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/scan_model.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {

    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition initialLocation = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17,
    );

    Set<Marker> markers = Set<Marker>();
    markers.add(Marker(
      markerId: const MarkerId('my-marker'),
      position: scan.getLatLng(),
    ));

    return Scaffold(
        appBar: AppBar(
          title: const Text('Mapa'),
          actions: [
            IconButton(
                onPressed: () async {
                  final GoogleMapController controller =
                      await _controller.future;
                  controller.animateCamera(
                      CameraUpdate.newCameraPosition(initialLocation));
                },
                icon: const Icon(Icons.location_searching_outlined))
          ],
        ),
        body: GoogleMap(
          mapType: mapType,
          markers: markers,
          initialCameraPosition: initialLocation,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.layers),
          onPressed: () {
            if(mapType == MapType.normal){
              mapType = MapType.satellite;
            }else{
              mapType = MapType.normal;
            }
            setState(() {});
          },
        ));
  }
}
