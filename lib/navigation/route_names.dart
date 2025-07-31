import 'package:demo/async_redux/view_model/add_product_connector.dart';
import 'package:demo/async_redux/view_model/get_product_connector.dart';
import 'package:demo/async_redux/view_model/update_price_connector.dart';
import 'package:demo/async_redux/view_model/update_product_connector.dart';
import 'package:demo/date_operations/date_operations_demo.dart';
import 'package:demo/file_demo/counter_storage.dart';
import 'package:demo/file_demo/file_demo.dart';
import 'package:demo/file_demo/file_picker.dart';
import 'package:demo/firebase/firebase_screen.dart';
import 'package:demo/firebase/notification_screen.dart';
import 'package:demo/firebase/push_notifications.dart';
import 'package:demo/firebase/remote_config.dart';
import 'package:demo/hive_database/hive_screen.dart';
import 'package:demo/icons/icons.dart';
import 'package:demo/images/images.dart';
import 'package:demo/localization/home_screen.dart';
import 'package:demo/localization/new_screen.dart';
import 'package:demo/network_api/model/product.dart';
import 'package:demo/network_api/screens/product_list_screen.dart';
import 'package:demo/permission_handling/permission_handler_screen.dart';
import 'package:demo/scrolling_widgets/gridview_demo.dart';
import 'package:demo/app_to_user_communication/linear_progress.dart';
import 'package:demo/scrolling_widgets/listview_demo.dart';
import 'package:demo/scrolling_widgets/singlechildscroll_demo.dart';
import 'package:demo/app_to_user_communication/snackbar.dart';
import 'package:demo/splash_screen/splash_screen.dart';
import 'package:demo/collection/stack_demo.dart';
import 'package:demo/scrolling_widgets/staggeredgridview_demo.dart';
import 'package:demo/timer/timer.dart';
import 'package:demo/user_to_app_communication/to_app_communication.dart';
import 'package:demo/app_to_user_communication/toast_demo.dart';
import 'package:demo/calendar/reverse_calendar.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String gridViewDemoScreen = '/GridviewDemoScreen';
  static const String toAppCommunicationScreen = '/ToAppCommunicationScreen';
  static const String snackbarDemoScreen = '/SnackbarDemoScreen';
  static const String toastDemoScreen = '/ToastDemoScreen';
  static const String linearProgressDemoScreen = '/LinearProgressDemoScreen';
  static const String stackDemoScreen = '/StackDemoScreen';
  static const String listviewDemoScreen = '/ListviewDemoScreen';
  static const String singlechildscrollDemoScreen =
      '/SinglechildscrollDemoScreen';
  static const String staggeredGridViewDemoScreen =
      '/StaggeredGridViewDemoScreen';
  static const String timerScreen = '/TimerScreen';
  static const String dateOperationsDemoScreen = '/DateOperationsDemoScreen';
  static const String splashScreen = '/SplashScreen';
  static const String calenderScreen = '/CalendarScreen';
  static const String localizationScreen = '/LocalizationScreen';
  static const String localeNewScreen = '/LocaleNewScreen';
  static const String imagesDemoScreen = '/ImagesDemoScreen';
  static const String iconsDemoScreen = '/IconsDemoScreen';
  static const String fileDemoScreen = '/FileDemoScreen';
  static const String filePickerScreen = '/FilePickerScreen';
  static const String productListScreen = '/ProductListScreen';
  static const String permissionHandlerScreen = '/PermissionHandlerScreen';
  static const String arProductListScreen = '/ARProductListScreen';
  static const String arAddProductScreen = '/ARAddProductScreen';
  static const String arUpdateProductScreen = '/ARUpdateProductScreen';
  static const String arUpdatePriceScreen = '/ARUpdatePriceScreen';
  static const String hiveScreen = '/HiveScreen';
  static const String firebaseScreen = '/FirebaseScreen';
  static const String remoteConfig = '/RemoteConfig';
  static const String pushNotification = '/PushNotification';
  static const String notificationScreen = '/NotificationScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? argument = settings.arguments;
    switch (settings.name) {
      case toAppCommunicationScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => ToAppCommunicationScreen(),
        );
      case snackbarDemoScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => SnackbarDemoScreen(),
        );
      case toastDemoScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => ToastDemoScreen(),
        );
      case linearProgressDemoScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => LinearProgressDemoScreen(),
        );
      case stackDemoScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => StackDemoScreen(),
        );
      case listviewDemoScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => ListviewDemoScreen(),
        );
      case singlechildscrollDemoScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => SinglechildscrollDemoScreen(),
        );
      case staggeredGridViewDemoScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => StaggeredGridViewDemoScreen(),
        );
      case timerScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => TimerScreen(),
        );
      case dateOperationsDemoScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => DateOperationsDemoScreen(),
        );
      case splashScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => SplashScreen(),
        );
      case calenderScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => ReverseCalendar(),
        );
      case localizationScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => LocalizationScreen(),
        );
      case localeNewScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => LocaleNewScreen(),
        );
      case imagesDemoScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => ImagesDemoScreen(),
        );
      case iconsDemoScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => IconsDemoScreen(),
        );
      case fileDemoScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              FileDemoScreen(storage: CounterStorage()),
        );
      case filePickerScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => FilePickerScreen(),
        );
      case productListScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => ProductListScreen(),
        );
      case permissionHandlerScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => PermissionHandlerScreen(),
        );
      case arProductListScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => GetProductConnector(),
        );
      case arAddProductScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => AddProductConnector(),
        );
      case arUpdateProductScreen:
        final product = argument is Product ? argument : null;
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              UpdateProductConnector(product: product!),
        );
      case arUpdatePriceScreen:
        final product = argument is Product ? argument : null;
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              UpdatePriceConnector(product: product!),
        );
      case hiveScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => HiveScreen(),
        );
      case firebaseScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => FirebaseScreen(),
        );
      case remoteConfig:
        return MaterialPageRoute(
          builder: (BuildContext context) => RemoteConfig(),
        );
      case pushNotification:
        return MaterialPageRoute(
          builder: (BuildContext context) => PushNotifications(),
        );
      case notificationScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => NotificationScreen(),
        );
      default:
        //final name = arugment == null ? "" : arugment as String;
        return MaterialPageRoute(
          builder: (BuildContext context) => GridviewDemoScreen(),
        );
    }
  }
}
