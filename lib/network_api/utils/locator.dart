import 'package:demo/network_api/services/data_service.dart';
import 'package:demo/network_api/services/web_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerLazySingleton<DataService>(WebDataService.new);
}
