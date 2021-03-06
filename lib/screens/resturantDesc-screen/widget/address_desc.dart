import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AddressDesc extends StatelessWidget {
  String latitude;
  String longitude;
  String? city;
  String address;

  AddressDesc({
    Key? key,
    required this.latitude,
    required this.longitude,
    this.city,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double lat = double.parse(latitude);
    double long = double.parse(longitude);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'آدرس: ' +
                    address,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.width / 2.8,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(lat, long),
                  zoom: 11.0,
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
                      Marker(
                        width: 20.0,
                        height: 20.0,
                        point: LatLng(35.72685718281043, 51.32285808890024),
                        builder: (ctx) => Container(
                          child: Icon(Icons.my_location_outlined),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
