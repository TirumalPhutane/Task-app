import 'package:async_redux/async_redux.dart';
import 'package:demo/common/app_state.dart';
import 'package:demo/firebase/remote_config_service.dart';
import 'package:demo/firebase_options.dart';
import 'package:demo/common/hive_constants.dart';
import 'package:demo/l10n/app_localizations.dart';
import 'package:demo/localization/locale_manager.dart';
import 'package:demo/network_api/utils/locator.dart';
import 'package:demo/scrolling_widgets/gridview_demo.dart';
import 'package:demo/navigation/route_names.dart';
import 'package:demo/theme_management/theme/theme.dart';
import 'package:demo/theme_management/theme_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';

final ThemeManager themeManager = ThemeManager();
final LocaleManager localeManager = LocaleManager();
final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message: ${message.messageId}');
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Data: ${message.data}');
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'Important Notifications',
  description: 'This channel is used for important notifications.',
  importance: Importance.high,
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.createNotificationChannel(channel);

  //initRemoteConfig();

  await Hive.initFlutter();
  await Hive.openBox(userHiveBox);

  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final store = Store<AppState>(initialState: AppState.initialState());

  @override
  void initState() {
    super.initState();
    themeManager.addListener(themeListener);
    localeManager.addListener(localeListener);
    RemoteConfigService.initRemoteConfig(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    themeManager.removeListener(themeListener);
    super.dispose();
  }

  void themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  void localeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        //debugShowCheckedModeBanner: false,
        locale: localeManager.locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeManager.currentTheme(),
        onGenerateRoute: RouteNames.generateRoute,
        home: GridviewDemoScreen(),
      ),
    );
  }
}
