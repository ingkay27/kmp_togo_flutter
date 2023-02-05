import 'package:get_it/get_it.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  SharedPreferencesManager? sharedPreferencesManager =
      await SharedPreferencesManager.getInstance();
  locator
      .registerSingleton<SharedPreferencesManager>(sharedPreferencesManager!);
}
