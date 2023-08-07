import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:younginnovationstask/src/domain/model/response/image_list_response.dart';
import 'package:younginnovationstask/src/utilis/constants/strings.dart';

part 'image_list_api_services.g.dart';

@RestApi(baseUrl: baseUrl,parser: Parser.MapSerializable)
abstract class ImageListApiServices{
  factory ImageListApiServices(Dio dio, {String baseUrl}) =
  _ImageListApiServices;

  @GET("$apiKey")
  Future<HttpResponse<List<ImageListResponse>>> getImageList();

}