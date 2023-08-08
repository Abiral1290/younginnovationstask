import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/model/response/image_list_response.dart';

abstract class FavouriteImageListState
    extends Equatable{

  final List<ImageListResponse> favouriteImageList;
  final DioException? exception;

  const FavouriteImageListState({this.exception,
    this.favouriteImageList =const[]});

  @override
  // TODO: implement props
  List<Object?> get props =>[favouriteImageList,exception];

}

class FavouriteImageListStateLoading extends FavouriteImageListState{
  const FavouriteImageListStateLoading();
}

class FavouriteImageListStateSuccess extends FavouriteImageListState{
  const FavouriteImageListStateSuccess({super.favouriteImageList});
}

class FavouriteImageListStateFailed extends FavouriteImageListState{
  const FavouriteImageListStateFailed({super.exception});
}

