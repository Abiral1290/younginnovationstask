import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:younginnovationstask/src/domain/model/request/image_list_request.dart';
import 'package:younginnovationstask/src/domain/model/response/image_list_response.dart';
import 'package:younginnovationstask/src/presentation/bloc/base/base_cubit.dart';
import 'package:younginnovationstask/src/presentation/bloc/state/image_list_state.dart';

import '../../../domain/repository/api_repository.dart';
import '../../../utilis/resources/data_state.dart';

class ImageListCubit extends
BaseCubit<ImageListState, List<ImageListResponse>>{

  final ApiRepository _apiRepository;
  ImageListCubit(this._apiRepository) : super(const ImageListStateLoading(),[]);


  Future<void> getImageList() async{
    if(isBusy) return;

    await run(() async{
      final response = await _apiRepository.getSearchList(searchRequest: ImageListRequest());

      if(response is DataSuccess){
        final imageList = response.data;

        log("my dasda $imageList");
        emit(ImageListStateSuccess(imageListResponse: imageList!,));
      }else if(response is DataFailed){
        emit(ImageListStateFailed(exception: DioException(requestOptions:
        RequestOptions(path: response.toString()))));
      }
    });
  }
}