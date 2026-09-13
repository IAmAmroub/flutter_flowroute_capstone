import 'package:flowroute_capstone/models/route_model.dart';

class RouteService {
  Future<RouteModel> fetchRoute({
    required String start,
    required String destination,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    final Map<String, dynamic> mockJson = {
      'start': start,
      'destination': destination,
      'total_distance': 8.5,
      'total_duration': 35,
      'segments': [
        {
          'mode': 'walk',
          'distance': 0.5,
          'duration': 7,
          'start': {
            'latitude': 33.5731,
            'longitude': -7.5898,
          },
          'end': {
            'latitude': 33.5800,
            'longitude': -7.6000,
          },
        },
        {
          'mode': 'transit',
          'distance': 6.0,
          'duration': 20,
          'start': {
            'latitude': 33.5800,
            'longitude': -7.6000,
          },
          'end': {
            'latitude': 33.5900,
            'longitude': -7.6100,
          },
        },
        {
          'mode': 'bike',
          'distance': 2.0,
          'duration': 8,
          'start': {
            'latitude': 33.5900,
            'longitude': -7.6100,
          },
          'end': {
            'latitude': 33.6000,
            'longitude': -7.6200,
          },
        },
      ],
    };
    return RouteModel.fromJson(mockJson);
  }
}
