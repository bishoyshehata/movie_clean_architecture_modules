import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:data/di/injection.config.dart';

@InjectableInit()
void configureCoreDataDependencies(GetIt getIt, String? environment) => getIt.init(environment: environment);