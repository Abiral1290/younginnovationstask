import 'package:younginnovationstask/src/domain/model/response/image_list_response.dart';

abstract class DatabaseRepository{

  Future<List<ImageListResponse>> getImageList();

  Future<void> insertImage(ImageListResponse imageListResponse);

  Future<void> removeImage(ImageListResponse imageListResponse);

}