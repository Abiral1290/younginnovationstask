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


  Future<void> getImageList({required ImageListRequest imageListRequest}) async{
    if(isBusy) return;

    await run(() async{
      log("my page increase ${imageListRequest.page.toString()}");
      final response = await _apiRepository.getSearchList(
          searchRequest: imageListRequest);

      if(response is DataSuccess){
        //List<ImageListResponse>? imageList =[];
        if(imageListRequest.page > 1){
          log("my list log ${ _apiRepository.imageList!.length}");
           _apiRepository.imageList!.addAll(response.data!);
          log("my list log ${ _apiRepository.imageList}");
          emit(ImageListStateSuccess(imageListResponse:  _apiRepository.imageList!,));
        }else{
          _apiRepository.imageList = response.data!;
          final imageLists = response.data;
          log("my dasda ${_apiRepository.imageList }");
          emit(ImageListStateSuccess(imageListResponse: imageLists!,));
        }
      }else if(response is DataFailed){
        emit(ImageListStateFailed(exception: DioException(requestOptions:
        RequestOptions(path: response.toString()))));
      }
    });
  }
}