import 'package:flutter/material.dart';

import '../models/route_model.dart';
import 'map_view_screen.dart';

class RouteResultScreen extends StatelessWidget {
  final RouteModel route;

  const RouteResultScreen({
    super.key,
    required this.route,
  });

  IconData _getModeIcon(String mode) {
    switch (mode) {
      case 'walk':
        return Icons.directions_walk;
      case 'bike':
        return Icons.directions_bike;
      case 'transit':
        return Icons.directions_bus;
      default:
        return Icons.route;
    }
  }

  Color _getModeColor(String mode) {
    switch (mode) {
      case 'walk':
        return Colors.green;
      case 'bike':
        return Colors.orange;
      case 'transit':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  String _getModeLabel(String mode) {
    switch (mode) {
      case 'walk':
        return 'Walking';
      case 'bike':
        return 'Bike';
      case 'transit':
        return 'Transit';
      default:
        return mode;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Details'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            '${route.start} → ${route.destination}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(
                    Icons.route,
                    size: 40,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Route Summary',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Distance: ${route.totalDistance} km',
                        ),
                        Text(
                          'Duration: ${route.totalDuration} min',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Journey Segments',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...route.segments.map(
            (segment) {
              final color = _getModeColor(segment.mode);

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: color.withOpacity(0.15),
                    child: Icon(
                      _getModeIcon(segment.mode),
                      color: color,
                    ),
                  ),
                  title: Text(
                    _getModeLabel(segment.mode),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Distance: ${segment.distance} km\n'
                    'Duration: ${segment.duration} min',
                  ),
                  isThreeLine: true,
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.map),
              label: const Text('View on Map'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MapViewScreen(
                      route: route,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
