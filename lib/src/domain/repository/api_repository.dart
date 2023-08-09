import 'dart:async';

import 'package:younginnovationstask/src/domain/model/request/image_list_request.dart';

import '../../utilis/resources/data_state.dart';
import '../model/response/image_list_response.dart';

abstract class ApiRepository{
 Future<DataState<List<ImageListResponse>>> getSearchList({
  required ImageListRequest searchRequest
});

 List<ImageListResponse>? imageList ;

}