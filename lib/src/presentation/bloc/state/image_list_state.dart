import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/model/response/image_list_response.dart';

abstract class ImageListState extends Equatable{

  final List<ImageListResponse> imageListResponse;
  final List<ImageListResponse> oldImageListResponse;
  final bool isFirstFetch;
  final DioException? exception;

  const ImageListState({this.exception,
    this.imageListResponse =const[],
    this.oldImageListResponse =const[],this.isFirstFetch = false});

  @override
  // TODO: implement props
  List<Object?> get props =>[imageListResponse,exception];

}


class ImageListStateInitial extends ImageListState{
  const ImageListStateInitial();
}
class ImageListStateLoading extends ImageListState{
  const ImageListStateLoading({super.oldImageListResponse,super.isFirstFetch});
}

class ImageListStateSuccess extends ImageListState{
  const ImageListStateSuccess({super.imageListResponse});
}

class ImageListStateFailed extends ImageListState{
  const ImageListStateFailed({super.exception});
}

