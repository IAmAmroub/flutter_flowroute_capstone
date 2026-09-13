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
    const startPoint = LatLng(33.5731, -7.5898);
    const transitPoint = LatLng(33.5800, -7.6000);
    const bikePoint = LatLng(33.5900, -7.6100);
    const destinationPoint = LatLng(33.6000, -7.6200);
    final polylines = <Polyline>{
      const Polyline(
        polylineId: PolylineId('walk'),
        points: [
          startPoint,
          transitPoint,
        ],
        width: 6,
        color: Colors.green,
      ),
      const Polyline(
        polylineId: PolylineId('transit'),
        points: [
          transitPoint,
          bikePoint,
        ],
        width: 6,
        color: Colors.blue,
      ),
      const Polyline(
        polylineId: PolylineId('bike'),
        points: [
          bikePoint,
          destinationPoint,
        ],
        width: 6,
        color: Colors.orange,
      ),
    };
    final markers = <Marker>{
      const Marker(
        markerId: MarkerId('start'),
        position: startPoint,
        infoWindow: InfoWindow(
          title: 'Start',
        ),
      ),
      const Marker(
        markerId: MarkerId('transit'),
        position: transitPoint,
        infoWindow: InfoWindow(
          title: 'Transit Stop',
        ),
      ),
      const Marker(
        markerId: MarkerId('bike'),
        position: bikePoint,
        infoWindow: InfoWindow(
          title: 'Bike Transfer',
        ),
      ),
      const Marker(
        markerId: MarkerId('destination'),
        position: destinationPoint,
        infoWindow: InfoWindow(
          title: 'Destination',
        ),
      ),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Map'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
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
