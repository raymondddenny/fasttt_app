import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapBoxMap extends StatefulWidget {
  final double lat;
  final double long;
  const MapBoxMap({
    Key? key,
    required this.lat,
    required this.long,
  }) : super(key: key);

  @override
  State<MapBoxMap> createState() => _MapBoxMapState();
}

class _MapBoxMapState extends State<MapBoxMap> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(
                widget.long,
                widget.lat,
              ),
              zoom: 18.0,
              maxZoom: 18.0,
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      "https://api.mapbox.com/styles/v1/dendenray/cl2smi6uv002u15omqq1gfdbj/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZGVuZGVucmF5IiwiYSI6ImNqdXZraHM0ejAyZmc0M2xhY21lMzJlMG8ifQ.btgI3w3EFCmKm5uviTXrDg",
                  attributionBuilder: (_) {
                    return const Text("© MapBox contributors");
                  },
                  additionalOptions: {
                    'accessToken': dotenv.get('MAPBOX_ACCESS_TOKEN'),
                    'id': 'mapbox.mapbox-streets-v8'
                  }),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 250.0,
                    height: 250.0,
                    point: LatLng(widget.long, widget.lat),
                    builder: (ctx) => Icon(
                      Icons.location_on,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
