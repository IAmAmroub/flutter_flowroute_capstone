import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/route_model.dart';

class RouteResultScreen extends StatelessWidget {
  final RouteModel route;
  const RouteResultScreen({super.key, required this.route});

  IconData _getModeIcon(String mode) {
    switch (mode) {
      case 'walk':
        return Icons.directions_walk;
      case 'bike':
        return Icons.directions_bike;
      case 'transit':
        return Icons.directions_transit;
      default:
        return Icons.route;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Details'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              '${route.start} →  ${route.destination}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: const Icon(Icons.route),
                title: const Text("Route Summary"),
                subtitle: Text(
                  'Distance: ${route.totalDistance} km\n'
                  'Duration: ${route.totalDuration} min',
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Route Segments',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...route.segments.map(
              (segment) => Card(
                  child: ListTile(
                leading: Icon(
                  _getModeIcon(segment.mode),
                ),
                title: Text(segment.mode.toUpperCase()),
                subtitle: Text(
                  'Distance: ${segment.distance} km\n'
                  'Duration: ${segment.duration} min',
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
