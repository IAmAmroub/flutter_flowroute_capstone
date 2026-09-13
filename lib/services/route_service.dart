import 'package:flowroute_capstone/models/route_model.dart';

class RouteService {
  Future<RouteModel> fetchRoute() async {
    await Future.delayed(const Duration(seconds: 2));

    final Map<String, dynamic> mockJson = {
      'start': 'Home',
      'destination': 'University',
      'total_distance': 8.5,
      'total_duration': 35,
      'segments': [
        {
          'mode': 'walk',
          'distance': 0.5,
          'duration': 7,
        },
        {
          'mode': 'transit',
          'distance': 6.0,
          'duration': 20,
        },
        {
          'mode': 'bike',
          'distance': 2.0,
          'duration': 8,
        },
      ],
    };
    return RouteModel.fromJson(mockJson);
  }
}
