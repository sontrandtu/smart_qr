import 'package:smart_qr/utils/shared_prefs.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setUpInjector() {
  locator.registerLazySingleton(() => SharedPrefs());
}
