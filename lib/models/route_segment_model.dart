class RouteSegment {
  final String mode;
  final double distance;
  final int duration;

  const RouteSegment({
    required this.mode,
    required this.distance,
    required this.duration,
  });

  factory RouteSegment.fromJson(Map<String, dynamic> json) {
    return RouteSegment(
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
