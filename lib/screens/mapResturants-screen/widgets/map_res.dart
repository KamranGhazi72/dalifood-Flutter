import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapRes extends StatelessWidget {
  const MapRes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(35.72685718281043, 51.32285808890024),
          zoom: 11.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/kamran1372/ckqdp3fof1enx18o4mcs2d7bn/wmts?access_token=pk.eyJ1Ijoia2FtcmFuMTM3MiIsImEiOiJja2w3dGkwMWwwOTRzMnJydncxMWVxYXBtIn0.RUMAja78Qzyd2PZScsK3Gw',
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1Ijoia2FtcmFuMTM3MiIsImEiOiJja2w3dGkwMWwwOTRzMnJydncxMWVxYXBtIn0.RUMAja78Qzyd2PZScsK3Gw',
              'id': 'mapbox.streets',
            },
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 20.0,
                height: 20.0,
                point: LatLng(35.72685718281043, 51.32285808890024),
                builder: (ctx) => Container(
                  child: Icon(Icons.location_on_outlined),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
