import 'package:demo/common/remote_config_constants.dart';
import 'package:demo/theme_management/app_colors.dart';
import 'package:flutter/material.dart';

class RemoteConfig extends StatefulWidget {
  const RemoteConfig({super.key});

  @override
  State<RemoteConfig> createState() => _RemoteConfigState();
}

class _RemoteConfigState extends State<RemoteConfig> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Remote Config')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Remote Config in Flutter',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 50),
              isLoading
                  ? const SizedBox(
                      width: 15,
                      height: 15,
                      child: CircularProgressIndicator(strokeWidth: 3),
                    )
                  : Column(
                      spacing: 10,
                      children: [
                        CustomCard(text: 'Name: $userName'),
                        CustomCard(text: 'Age: $userAge'),
                        CustomCard(text: 'Hobbie: $userHobbie'),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: AppColors.lightBlue,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(text, style: TextStyle(color: AppColors.darkCard)),
        ),
      ),
    );
  }
}
