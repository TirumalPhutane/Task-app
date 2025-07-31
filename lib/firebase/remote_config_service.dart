import 'package:demo/main.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  static Future<void> initRemoteConfig(Function onUpdate) async {
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(minutes: 1),
      ),
    );

    // await remoteConfig.setDefaults({
    //   'name': 'Tirumal',
    //   'age': 26,
    //   'hobbie': 'Cricket',
    // });

    await remoteConfig.fetchAndActivate();

    remoteConfig.onConfigUpdated.listen((event) async {
      await remoteConfig.activate();
      onUpdate();
    });
  }
}
