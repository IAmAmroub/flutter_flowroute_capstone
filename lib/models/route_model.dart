import 'package:flowroute_capstone/models/route_segment_model.dart';

class RouteModel {
  final String start;
  final String destination;
  final double totalDistance;
  final int totalDuration;
  final List<RouteSegmentModel> segments;

  const RouteModel({
    required this.start,
    required this.destination,
    required this.totalDistance,
    required this.totalDuration,
    required this.segments,
  });

  factory RouteModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> segmentsJson = json['segments'] ?? [];

    return RouteModel(
      start: json['start'] ?? '',
      destination: json['destination'] ?? '',
      totalDistance: (json['total_distance'] ?? 0).toDouble(),
      totalDuration: json['total_duration'] ?? 0,
      segments: segmentsJson
          .map(
            (segment) => RouteSegmentModel.fromJson(
              segment as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'start': start,
      'destination': destination,
      'total_distance': totalDistance,
      'total_duration': totalDuration,
      'segments': segments.map((segment) => segment.toJson()).toList(),
    };
  }
}
