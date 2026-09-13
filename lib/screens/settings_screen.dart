import 'package:flowroute_capstone/state_management/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          final isDarkMode = themeMode == ThemeMode.dark;

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              SwitchListTile(
                title: const Text('Dark Mode'),
                subtitle: const Text(
                  'Enable dark theme for the application',
                ),
                value: isDarkMode,
                onChanged: (value) {
                  context.read<ThemeCubit>().toggleTheme(value);
                },
                secondary: Icon(
                  isDarkMode ? Icons.dark_mode : Icons.light_mode,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
