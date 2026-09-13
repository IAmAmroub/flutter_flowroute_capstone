class RouteSegmentModel {
  final String mode;
  final double distance;
  final int duration;

  const RouteSegmentModel({
    required this.mode,
    required this.distance,
    required this.duration,
  });

  factory RouteSegmentModel.fromJson(Map<String, dynamic> json) {
    return RouteSegmentModel(
      mode: json['mode'] ?? '',
      distance: (json['distance'] ?? 0).toDouble(),
      duration: json['duration'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mode': mode,
      'distance': distance,
      'duration': duration,
    };
  }
}
