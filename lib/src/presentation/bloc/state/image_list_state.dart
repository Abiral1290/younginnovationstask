import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/model/response/image_list_response.dart';

abstract class ImageListState extends Equatable{

  final List<ImageListResponse> imageListResponse;
  final DioException? exception;

  const ImageListState({this.exception,
    this.imageListResponse =const[]});

  @override
  // TODO: implement props
  List<Object?> get props =>[imageListResponse,exception];

}

class ImageListStateLoading extends ImageListState{
  const ImageListStateLoading();
}

class ImageListStateSuccess extends ImageListState{
  const ImageListStateSuccess({super.imageListResponse});
}

class ImageListStateFailed extends ImageListState{
  const ImageListStateFailed({super.exception});
}

