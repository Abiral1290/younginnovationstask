import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:younginnovationstask/src/domain/model/response/image_list_response.dart';
import 'package:younginnovationstask/src/domain/repository/api_repository.dart';


class MockApiRepository  extends Mock implements ApiRepository{}


@GenerateMocks(<Type>[MockApiRepository])
void main() {
  List<ImageListResponse> country = (
       [
         ImageListResponse(
             user: 'abraham', type: 'jhu', tags: 'jghf'
         )
       ]
  );

  test('request fetch list', ()async{
    log(country.toString());

    // when(mockApiRepository.getCountryList(request:  CountryRequest(
    // ))).thenAnswer((_) async{
    //   log(country.toString());
    // return country;
    // });

    // response = await mockApiRepository.getCountryList(request:  CountryRequest(
    //   sources: 'countriesnow.space',
    //   page: 1,
    //   pageSize: defaultPageSize,
    // ));

    expect(country, '');
  });
}