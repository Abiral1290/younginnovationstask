import 'dart:async';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:younginnovationstask/src/data/datasources/local/app_database.dart';
import 'package:younginnovationstask/src/data/datasources/remote/image_list_api_services.dart';
import 'package:younginnovationstask/src/data/repositories/api_repository_implementation.dart';
import 'package:younginnovationstask/src/data/repositories/database_repository_implementation.dart';
import 'package:younginnovationstask/src/utilis/constants/strings.dart';

import 'domain/repository/api_repository.dart';
import 'domain/repository/database_repository.dart';


final locator = GetIt.instance;

Future<void> initializeDependencies() async{


  final db = await $FloorAppDatabase.databaseBuilder(databaseName).build();
  locator.registerSingleton<AppDatabase>(db);
  locator.registerSingleton<DatabaseRepository>(
    DatabaseRepositoryImplementation(locator<AppDatabase>()),
  );


  final dio = Dio();

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<ImageListApiServices>(
    ImageListApiServices(locator<Dio>())
  );
  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImplementation(locator<ImageListApiServices>(),)
  );

}