class RouteSegmentModel {
  final String mode;
  final double distance;
  final int duration;
  final double startLatitude;
  final double startLongitude;
  final double endLatitude;
  final double endLongitude;

  const RouteSegmentModel({
    required this.mode,
    required this.distance,
    required this.duration,
    required this.startLatitude,
    required this.startLongitude,
    required this.endLatitude,
    required this.endLongitude,
  });

  factory RouteSegmentModel.fromJson(Map<String, dynamic> json) {
    return RouteSegmentModel(
      mode: json['mode'] ?? '',
      distance: (json['distance'] ?? 0).toDouble(),
      duration: json['duration'] ?? 0,
      startLatitude: (json['start']['latitude'] ?? 0).toDouble(),
      startLongitude: (json['start']['longitude'] ?? 0).toDouble(),
      endLatitude: (json['end']['latitude'] ?? 0).toDouble(),
      endLongitude: (json['end']['longitude'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mode': mode,
      'distance': distance,
      'duration': duration,
      'start': {
        'latitude': startLatitude,
        'longitude': startLongitude,
      },
      'end': {
        'latitude': endLatitude,
        'longitude': endLongitude,
      },
    };
  }
}
