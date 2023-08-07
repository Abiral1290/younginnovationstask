import 'dart:async';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:younginnovationstask/src/data/datasources/remote/image_list_api_services.dart';
import 'package:younginnovationstask/src/data/repositories/api_repository_implementation.dart';

import 'domain/repository/api_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async{

  final dio = Dio();

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<ImageListApiServices>(
    ImageListApiServices(locator<Dio>())
  );


  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImplementation(locator<ImageListApiServices>(),)
  );


}