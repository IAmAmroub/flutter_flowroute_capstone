import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/route_model.dart';

class MapViewScreen extends StatelessWidget {
  final RouteModel route;

  const MapViewScreen({
    super.key,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    // const startPoint = LatLng(33.5731, -7.5898);
    // const transitPoint = LatLng(33.5800, -7.6000);
    // const bikePoint = LatLng(33.5900, -7.6100);
    // const destinationPoint = LatLng(33.6000, -7.6200);
    final polylines = route.segments.map((segment) {
      Color color;

      switch (segment.mode) {
        case 'walk':
          color = Colors.green;
          break;

        case 'transit':
          color = Colors.blue;
          break;

        case 'bike':
          color = Colors.orange;
          break;

        default:
          color = Colors.grey;
      }

      return Polyline(
        polylineId: PolylineId(segment.mode),
        points: [
          LatLng(
            segment.startLatitude,
            segment.startLongitude,
          ),
          LatLng(
            segment.endLatitude,
            segment.endLongitude,
          ),
        ],
        width: 6,
        color: color,
      );
    }).toSet();

    final firstSegment = route.segments.first;
    final lastSegment = route.segments.last;

    final startPoint = LatLng(
      firstSegment.startLatitude,
      firstSegment.startLongitude,
    );

    final destinationPoint = LatLng(
      lastSegment.endLatitude,
      lastSegment.endLongitude,
    );

    final markers = <Marker>{
      Marker(
        markerId: const MarkerId('start'),
        position: startPoint,
        infoWindow: InfoWindow(
          title: route.start,
        ),
      ),
      Marker(
        markerId: const MarkerId('destination'),
        position: destinationPoint,
        infoWindow: InfoWindow(
          title: route.destination,
        ),
      ),
    };
    // final polylines = route.segments.map((segment) {
    //   Color color;

    //   switch (segment.mode) {
    //     case 'walk':
    //       color = Colors.green;
    //       break;

    //     case 'transit':
    //       color = Colors.blue;
    //       break;

    //     case 'bike':
    //       color = Colors.orange;
    //       break;

    //     default:
    //       color = Colors.grey;
    //   }

    //   return Polyline(
    //     polylineId: PolylineId(segment.mode),
    //     points: [
    //       LatLng(
    //         segment.startLatitude,
    //         segment.startLongitude,
    //       ),
    //       LatLng(
    //         segment.endLatitude,
    //         segment.endLongitude,
    //       ),
    //     ],
    //     width: 6,
    //     color: color,
    //   );
    // }).toSet();
    // final markers = <Marker>{
    //   const Marker(
    //     markerId: MarkerId('start'),
    //     position: startPoint,
    //     infoWindow: InfoWindow(
    //       title: 'Start',
    //     ),
    //   ),
    //   const Marker(
    //     markerId: MarkerId('transit'),
    //     position: transitPoint,
    //     infoWindow: InfoWindow(
    //       title: 'Transit Stop',
    //     ),
    //   ),
    //   const Marker(
    //     markerId: MarkerId('bike'),
    //     position: bikePoint,
    //     infoWindow: InfoWindow(
    //       title: 'Bike Transfer',
    //     ),
    //   ),
    //   const Marker(
    //     markerId: MarkerId('destination'),
    //     position: destinationPoint,
    //     infoWindow: InfoWindow(
    //       title: 'Destination',
    //     ),
    //   ),
    // };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Map'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: startPoint,
                zoom: 13,
              ),
              markers: markers,
              polylines: polylines,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _LegendItem(
                  color: Colors.green,
                  icon: Icons.directions_walk,
                  label: 'Walk',
                ),
                _LegendItem(
                  color: Colors.blue,
                  icon: Icons.directions_bus,
                  label: 'Transit',
                ),
                _LegendItem(
                  color: Colors.orange,
                  icon: Icons.directions_bike,
                  label: 'Bike',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;

  const _LegendItem({
    required this.color,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(label),
      ],
    );
  }
}
