import 'package:demo/theme_management/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart'
    hide PermissionStatus;

class PermissionHandlerScreen extends StatefulWidget {
  const PermissionHandlerScreen({super.key});

  @override
  State<PermissionHandlerScreen> createState() =>
      _PermissionHandlerScreenState();
}

class _PermissionHandlerScreenState extends State<PermissionHandlerScreen> {
  LocationData? locationData;

  Future<void> checkCameraPermission(BuildContext context) async {
    final status = await Permission.camera.request();

    if (!context.mounted) return;

    if (status.isGranted) {
      _showSnackbar(context, 'Permission is granted');
    } else if (status.isLimited) {
      _showSnackbar(context, 'Permission is limited');
    } else if (status.isRestricted) {
      _showSnackbar(context, 'Permission is restricted');
    } else if (status.isPermanentlyDenied) {
      _showSnackbar(
        context,
        'Permission is permanently denied. Please enable it from settings.',
        action: const SnackBarAction(
          label: 'Settings',
          onPressed: openAppSettings,
          textColor: AppColors.white,
        ),
      );
    } else {
      _showSnackbar(context, 'Permission is denied');
    }
  }

  Future<void> checkLocationPermission(BuildContext context) async {
    final location = Location();
    var serviceEnabled = await location.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        if (!context.mounted) return;
        _showSnackbar(context, 'Location service is still not enabled.');
      }
    }

    var status = await location.hasPermission();
    if (status == PermissionStatus.denied) {
      status = await location.requestPermission();
      if (status != PermissionStatus.granted) {
        if (!context.mounted) return;
        _showSnackbar(
          context,
          'Permission is permanently denied. Please enable it from settings.',
          action: const SnackBarAction(
            label: 'Settings',
            onPressed: openAppSettings,
            textColor: AppColors.white,
          ),
        );
      }
    }

    final data = await location.getLocation();
    setState(() {
      locationData = data;
    });
  }

  void _showSnackbar(
    BuildContext context,
    String message, {
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        // backgroundColor: Colors.white,
        // elevation: 10,
        // behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
        action: action,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Permissions Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                checkCameraPermission(context);
              },
              child: const Text('Check Camera Permission'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                checkLocationPermission(context);
              },
              child: const Text('Check Location Permission.'),
            ),
            const SizedBox(height: 20),
            Text(
              locationData != null
                  ? 'Location details:\n'
                        'Latitude: ${locationData!.latitude}\n'
                        'Longitude: ${locationData!.longitude}'
                  : 'Location not yet fetched.',
            ),
          ],
        ),
      ),
    );
  }
}
