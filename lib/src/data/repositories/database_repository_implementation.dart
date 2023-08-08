import 'package:younginnovationstask/src/data/datasources/local/app_database.dart';
import 'package:younginnovationstask/src/domain/model/request/image_list_request.dart';

import 'package:younginnovationstask/src/domain/model/response/image_list_response.dart';
import 'package:younginnovationstask/src/domain/repository/database_repository.dart';

import 'package:younginnovationstask/src/utilis/resources/data_state.dart';

import '../../domain/repository/api_repository.dart';

class DatabaseRepositoryImplementation extends DatabaseRepository{

  final AppDatabase _appDatabase;
  
  DatabaseRepositoryImplementation(this._appDatabase);

  @override
  Future<List<ImageListResponse>> getImageList() {
    // TODO: implement getImageList
    return _appDatabase.imageDao.getAllImages();
  }

  @override
  Future<void> insertImage(ImageListResponse imageListResponse) {
    // TODO: implement insertImage
    return _appDatabase.imageDao.insertImage(imageListResponse);
  }

  @override
  Future<void> removeImage(ImageListResponse imageListResponse) {
    // TODO: implement removeImage
    return _appDatabase.imageDao.deleteUserById(imageListResponse.id!);
  }
  
 
}