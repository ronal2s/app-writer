import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart";
import 'package:cuts/utils/const.dart';

class MapView extends StatelessWidget {
  final double height;
  final double latitude;
  final double longitude;
  final List<Map<String, String>> markers;
  MapView({
    Key key,
    this.height,
    @required this.latitude,
    @required this.longitude,
    this.markers,
  });
//  const [
//       {'latitude': '12', 'longitude': '12', 'title': 'prueba'}
//     ],
  @override
  Widget build(BuildContext context) {
    print(markers[0]['latitude']);
    print(markers[0]['longitude']);
    print(markers[0]['title']);
    print(markers[0].toString());
    return Container(
      width: double.infinity,
      height: height is double ? height : 150,
      child: FlutterMap(
        options: MapOptions(center: LatLng(latitude, longitude), zoom: 11),
        layers: [
          TileLayerOptions(
            urlTemplate: MAPBOX_STYLE,
            additionalOptions: {
              'accessToken': MAPBOX_KEY,
              'id': 'mapbox.streets',
            },
          ),
          MarkerLayerOptions(
              markers: markers
                  .map(
                    (marker) => Marker(
                      width: 45,
                      height: 40,
                      point: LatLng(double.parse(marker['latitude']),
                          double.parse(marker['longitude'])),
                      builder: (context) => Column(
                        children: [
                          Icon(Icons.room_rounded, color: Colors.red),
                          Text(
                            marker['title'],
                            style: TextStyle(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          )
                        ],
                      ),
                    ),
                  )
                  .toList())
        ],
      ),
    );
  }
}
