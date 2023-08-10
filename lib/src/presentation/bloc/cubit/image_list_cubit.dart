
import 'package:dio/dio.dart';
import 'package:younginnovationstask/src/domain/model/request/image_list_request.dart';
import 'package:younginnovationstask/src/domain/model/response/image_list_response.dart';
import 'package:younginnovationstask/src/presentation/bloc/base/base_cubit.dart';
import 'package:younginnovationstask/src/presentation/bloc/state/image_list_state.dart';

import '../../../domain/repository/api_repository.dart';
 import '../../../utilis/resources/data_state.dart';

class ImageListCubit extends
BaseCubit<ImageListState, List<ImageListResponse>>{

  int page =1;
  final ApiRepository _apiRepository;
  ImageListCubit(this._apiRepository) : super(const ImageListStateInitial(),[]);


  Future<void> getImageList() async{
    if(isBusy) return;


    await run(() async{

      if(state is ImageListStateLoading) return;
      final currentState = state;

      var oldImageList = <ImageListResponse>[];

      if(currentState is ImageListStateSuccess){
        oldImageList = currentState.imageListResponse;
      }

      emit(ImageListStateLoading(oldImageListResponse: oldImageList, isFirstFetch: page ==1));

      final response = await _apiRepository.getSearchList(
          searchRequest: ImageListRequest(page: page));

      if(response is DataSuccess){
        page++;

        List<ImageListResponse> newImageList = response.data!;
        final image = (state as ImageListStateLoading).oldImageListResponse;

        image.addAll(newImageList);

        emit(ImageListStateSuccess(imageListResponse:  image,));

      }else if(response is DataFailed){
        emit(ImageListStateFailed(exception: DioException(requestOptions:
        RequestOptions(path: response.toString()))));
      }
    });
  }

  Future<void> searchImageList({required ImageListRequest imageListRequest}) async{
    if(isBusy) return;


    await run(() async{




      final response = await _apiRepository.getSearchList(
          searchRequest: imageListRequest);

      if(response is DataSuccess){

        final image =  response.data!;


        emit(ImageListStateSuccess(imageListResponse:  image,));

      }else if(response is DataFailed){
        emit(ImageListStateFailed(exception: DioException(requestOptions:
        RequestOptions(path: response.toString()))));
      }
    });
  }

}