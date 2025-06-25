import 'package:app_settings/di/injection.dart';
import 'package:data/di/injection.dart';
import 'package:datastore/di/injection.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_clean_architecture_modules/di/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies(String? environment) async {
 await getIt.init(environment: environment);
 await configureAppSettingsDependencies(getIt, environment);
 await configureDataStoreDependencies(getIt, environment);
  configureCoreDataDependencies(getIt, environment);
}
