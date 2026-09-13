import 'package:flowroute_capstone/models/route_model.dart';
import 'package:flowroute_capstone/screens/route_result_screen.dart';
import 'package:flutter/material.dart';

import '../services/route_service.dart';

class RouteInputScreen extends StatefulWidget {
  const RouteInputScreen({super.key});

  @override
  State<RouteInputScreen> createState() => _RouteInputScreenState();
}

class _RouteInputScreenState extends State<RouteInputScreen> {
  final _startController = TextEditingController();
  final _destinationController = TextEditingController();

  final RouteService _routeService = RouteService();

  bool _isLoading = false;

  Future<void> _findRoute() async {
    final start = _startController.text.trim();
    final destination = _destinationController.text.trim();

    FocusScope.of(context).unfocus();

    if (start.isEmpty || destination.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter both start and destination.'),
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final RouteModel route = await _routeService.fetchRoute();

      if (!mounted) return;

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: ((context) => RouteResultScreen(route: route)),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to load route.'),
        ),
      );
    } finally {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _startController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("FlowRoute"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: _startController,
              decoration: const InputDecoration(
                labelText: 'Start',
                hintText: 'Enter starting location',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.my_location),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _destinationController,
              decoration: const InputDecoration(
                label: Text("destination"),
                hintText: "enter the destination place",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _isLoading ? null : _findRoute,
                icon: const Icon(Icons.route),
                label: Text(_isLoading ? 'Finding Route...' : 'Find Route'),
              ),
            ),
            if (_isLoading) ...[
              const SizedBox(height: 20),
              const CircularProgressIndicator(),
            ],
          ],
        ),
      ),
    );
  }
}
