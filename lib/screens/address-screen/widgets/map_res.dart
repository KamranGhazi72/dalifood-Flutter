import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapRes extends StatefulWidget {
  const MapRes({ Key? key }) : super(key: key);

  @override
  _MapResState createState() => _MapResState();
}

class _MapResState extends State<MapRes> {

  static LatLng myLocation = new LatLng(33.51189550112129, 48.35531868707115);
  @override
  void initState() {
    super.initState();
    setState(() {
      new LatLng(33.51189550112129, 48.35531868707115);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterMap(
        options: MapOptions(
          center: myLocation,
          zoom: 16.0,
          onTap: _handleTap,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/kamran1372/ckqdqgwww2wz717u3eeenrbpf/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia2FtcmFuMTM3MiIsImEiOiJja2w3dGkwMWwwOTRzMnJydncxMWVxYXBtIn0.RUMAja78Qzyd2PZScsK3Gw',
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1Ijoia2FtcmFuMTM3MiIsImEiOiJja2w3dGkwMWwwOTRzMnJydncxMWVxYXBtIn0.RUMAja78Qzyd2PZScsK3Gw',
              'id': 'mapbox.streets',
            },
          ),

          MarkerLayerOptions(
            markers: [
              // Marker(
              //   width: 40.0,
              //   height: 40.0,
              //   point: LatLng(33.51189550112129, 48.35531868707115),
              //   builder: (ctx) => Container(
              //     child: IconButton(
              //       icon: Icon(Icons.fastfood_rounded),
              //       color: Color(0xFFe91e63),
              //       onPressed: () => showDialog<String>(
              //         context: context,
              //         builder: (BuildContext context) => Stack(
              //           alignment: Alignment.bottomCenter,
              //           children: [
              //             Container(
              //               width: MediaQuery.of(context).size.width / 1.2,
              //               child: Column(
              //                 children: [],
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              Marker(
                width: 20.0,
                height: 20.0,
                point: myLocation,
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.fastfood_rounded,
                    color: Color(0xFFe91e63),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  _handleTap(LatLng point) {
    setState(() {
      myLocation = point;
    });
    print('MyLocation:::  $myLocation');
  }
}
