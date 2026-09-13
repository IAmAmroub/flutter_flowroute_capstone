# FlowRoute Capstone

FlowRoute is a Flutter route-planning application demonstrating multi-modal transportation, state management, Google Maps integration, simulated API data, and light/dark theme personalization.

The application supports routes composed of multiple transportation modes such as walking, public transit, and cycling.

## Features

- Multi-modal route modeling
- Walking, transit, and cycling route segments
- Simulated route API
- JSON parsing into Dart models
- Start and destination input
- Route summary and segment details
- Google Maps integration
- Different visual styles for transportation modes
- Light and dark themes
- Theme state management using Cubit
- Input validation
- Loading and error feedback
- GitFlow-style version control

## Multi-Modal Routing

A single FlowRoute journey can contain several transportation modes.

Example:

```text
Home
  |
  | Walk
  v
Bus Stop
  |
  | Transit
  v
City Center
  |
  | Bike
  v
University
```

Each segment contains information such as:

- transportation mode
- distance
- duration
- start coordinates
- end coordinates

## Architecture

The application separates models, services, state management, and UI.

```text
User Input
    |
    v
RouteInputScreen
    |
    v
RouteService
    |
    v
Simulated JSON
    |
    v
RouteModel
    |
    +---- List<RouteSegment>
    |
    v
RouteResultScreen
    |
    v
MapViewScreen
```

Theme management follows:

```text
SettingsScreen
      |
      v
ThemeCubit
      |
      v
ThemeMode
      |
      v
MaterialApp
      |
      +---- Light Theme
      |
      +---- Dark Theme
```

## Project Structure

```text
lib/
|
├── screenshots/
│   ├── flutter_01.png
│   ├── flutter_02.png
│   ├── flutter_03.png
│   ├── ...
│   └── flutter_14.png
|
├── models/
│   ├── route_model.dart
│   └── route_segment_model.dart
|
├── screens/
│   ├── route_input_screen.dart
│   ├── route_result_screen.dart
│   ├── map_view_screen.dart
│   └── settings_screen.dart
|
├── services/
│   └── route_service.dart
|
├── state_management/
│   └── theme_cubit.dart
|
└── main.dart
```

## Route Data Model

`RouteModel` represents the complete journey.

It contains:

```text
RouteModel
├── start
├── destination
├── totalDistance
├── totalDuration
└── segments
```

Each element of `segments` is a `RouteSegmentModel`.

```text
RouteSegmentModel
├── mode
├── distance
├── duration
├── startLatitude
├── startLongitude
├── endLatitude
└── endLongitude
```

## Simulated API

The application simulates fetching a multi-modal route from an API.

Example:

```json
{
  "start": "Home",
  "destination": "University",
  "total_distance": 8.5,
  "total_duration": 35,
  "segments": [
    {
      "mode": "walk",
      "distance": 0.5,
      "duration": 7,
      "start": {
        "latitude": 33.5731,
        "longitude": -7.5898
      },
      "end": {
        "latitude": 33.58,
        "longitude": -7.6
      }
    }
  ]
}
```

`RouteService` converts the simulated JSON response into a `RouteModel`.

## Google Maps

The application uses `google_maps_flutter` to display route information.

The transportation modes are visually distinguished:

- Walking - green
- Transit - blue
- Bike - orange

The map displays route polylines and start/destination markers.

### Google Maps API Key

A Google Maps API key is required when running the map functionality.

For Android, configure the key in:

```text
android/app/src/main/AndroidManifest.xml
```

Inside the `<application>` element:

```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_API_KEY" />
```

Do not commit an unrestricted production API key to a public repository.

## Theme Management

The application uses `flutter_bloc` and `ThemeCubit`.

The Settings screen provides a Dark Mode switch.

```text
Switch
  |
  v
ThemeCubit.toggleTheme()
  |
  v
emit(ThemeMode)
  |
  v
MaterialApp rebuilds
```

This updates the theme across the entire application.

## Dependencies

Important dependencies include:

```yaml
dependencies:
  flutter:
    sdk: flutter

  flutter_bloc:
  google_maps_flutter:
```

See `pubspec.yaml` for the exact versions used by the project.

## Installation

Clone the repository:

```bash
git clone https://github.com/IAMAmroub/flowroute-capstone.git
```

Enter the project:

```bash
cd flowroute-capstone
```

Install dependencies:

```bash
flutter pub get
```

Check the Flutter environment:

```bash
flutter doctor
```

Analyze the project:

```bash
flutter analyze
```

Run the application:

```bash
flutter run
```

## Application Flow

1. Launch FlowRoute.
2. Enter a starting location.
3. Enter a destination.
4. Tap **Find Route**.
5. The simulated service loads a multi-modal route.
6. Review the route summary.
7. Review walking, transit, and cycling segments.
8. Tap **View on Map** to visualize the route.
9. Open **Settings**.
10. Toggle Dark Mode to change the application theme.

## Git Workflow

The project follows a GitFlow-style workflow.

```text
feature/*
    |
    v
develop
    |
    v
release/v1.0-capstone
    |
    v
main
```

### Main

Contains stable production-ready code.

### Develop

Integration branch for completed features.

### Feature Branches

Used for individual features.

Example:

```text
feature/multimodal-route-model
```

### Release Branch

The final capstone release is prepared on:

```text
release/v1.0-capstone
```

## Release History

The final Git history is exported to:

```text
GitLog_Release_v1.0.txt
```

## Code Quality

Format the Dart code:

```bash
dart format lib
```

Run static analysis:

```bash
flutter analyze
```

The final project should contain no unnecessary imports, duplicate code, or analyzer errors.

## Technologies

- Dart
- Flutter
- flutter_bloc
- Cubit
- Google Maps Flutter
- Git
- GitHub

## Current Scope

FlowRoute is a capstone demonstration application.

Route responses and route coordinates are currently simulated rather than retrieved from a live routing service. A production implementation would replace the simulated service with a real routing API while retaining the application's model/service/UI architecture.
