
import 'package:floor/floor.dart';
import 'package:younginnovationstask/src/domain/model/response/image_list_response.dart';

import '../../../../utilis/constants/strings.dart';

@dao
abstract class ImageListDao{
  @Query("SELECT * FROM $imageTableName")
  Future<List<ImageListResponse>> getAllImages();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertImage(ImageListResponse imageListResponse);

  @Query("DELETE FROM $imageTableName WHERE id = :id")
  Future<void> deleteUserById(int id);
}