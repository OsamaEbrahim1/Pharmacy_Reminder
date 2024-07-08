
import 'package:get_it/get_it.dart';
import 'package:reminder_app/cache/cache_helper.dart';

final getIt = GetIt.instance;
void setupServiceLocator(){
  getIt.registerSingleton<CacheHelper>(CacheHelper());
}