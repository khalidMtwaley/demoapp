part of 'injection_container.dart';

final sl = GetIt.instance;
Future<void> initDependencies() async {

  sl.registerFactory(() => InternetConnection());
  //Core

  sl.registerFactory<ConnectionChecker>(() => ConnectionCheckerImpl(sl()));
}
