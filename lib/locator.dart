import 'package:get_it/get_it.dart';
import 'package:hospital_staff_data/services/dialog_service.dart';
import 'package:hospital_staff_data/services/fetchData.dart';
import 'package:hospital_staff_data/services/navigationService.dart';

final locator = GetIt.instance;

void setupLocator() {
  
locator.registerLazySingleton(() =>FetchDataService());
locator.registerLazySingleton(() => NavigationService());
locator.registerLazySingleton(() => DialogService());
// // locator.registerLazySingleton(() =>LoginViewModel());
// // locator.registerLazySingleton(() =>SignUpViewModel());
// locator.registerLazySingleton(() =>SettingsViewModel());

// getIt.registerLazySingleton<Authentication>(() =>Authentication());
// getIt.registerLazySingleton<Authentication>(() =>Authentication());
// getIt.registerLazySingleton<Authentication>(() =>Authentication());
// getIt.registerLazySingleton<Authentication>(() =>Authentication());

}