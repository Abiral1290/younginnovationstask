import 'package:younginnovationstask/src/data/repositories/base/base_api_repository.dart';
import 'package:younginnovationstask/src/domain/model/request/image_list_request.dart';
import 'package:younginnovationstask/src/domain/repository/api_repository.dart';
import 'package:younginnovationstask/src/utilis/resources/data_state.dart';

import '../../domain/model/response/image_list_response.dart';
import '../datasources/remote/image_list_api_services.dart';

class ApiRepositoryImplementation extends
BaseApiRepository implements ApiRepository{

  final ImageListApiServices imageListApiServices;

  ApiRepositoryImplementation(this.imageListApiServices);

  @override
  Future<DataState<List<ImageListResponse>>>
  getSearchList({required ImageListRequest searchRequest}) {
    // TODO: implement repository
    return getstate<List<ImageListResponse>>(request: ()=> imageListApiServices.
    getImageList(searchRequest.searchKeywords,searchRequest.page));
  }
}