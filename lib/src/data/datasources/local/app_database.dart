import 'dart:async';

import 'package:floor/floor.dart';
import 'package:younginnovationstask/src/data/datasources/local/converters/source_type_converter.dart';
import 'package:younginnovationstask/src/domain/model/response/image_list_response.dart';

import 'dao/image_list_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@TypeConverters([SourceTypeConverter])
@Database(version: 1, entities: [ImageListResponse])
abstract class AppDatabase extends FloorDatabase{
  ImageListDao get imageDao;
}