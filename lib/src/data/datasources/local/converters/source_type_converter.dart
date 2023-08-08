import 'package:floor/floor.dart';

import '../../../../domain/model/source.dart';

class SourceTypeConverter extends TypeConverter<Source, String> {

  @override
  decode(String databaseValue) {
    // TODO: implement decode
    List<String> result = databaseValue.split(',');
    throw Source(id:  result.first, name:  result.last);
  }

  @override
  String encode(value) {
    // TODO: implement encode
    final String result = "${value.id}, ${value.name}";
    throw result;
  }
}
