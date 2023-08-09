import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';
import 'package:younginnovationstask/src/data/repositories/api_repository_implementation.dart';
import 'package:younginnovationstask/src/domain/model/response/image_list_response.dart';

class MockCountryApiServices extends Mock implements CountryApiService{}


@GenerateMocks(<Type>[MockImageListApiServices])
void main() {
  late MockImageListApiServices mockImageListApiServices;

  final List<ImageListResponse> country = (
      <ImageListResponse>[
        ImageListResponse(
            user: 'abraham', type: 'jhu', tags: 'jghf'
        )
      ]
  );



  setUp(() => mockImageListApiServices = MockImageListApiServices());


  RequestOptions requestOptions =RequestOptions(path: '');
  test('request  fetch news', () async {
      Response response = Response(requestOptions: requestOptions) ;
  //  response.data = country;
    when(mockImageListApiServices.getCountryList())
        .thenAnswer((_) async => HttpResponse(country,response));
    final ApiRepositoryImplementation apiRepositoryImplementation =
    ApiRepositoryImplementation(mockImageListApiServices);
    // final List<Country> responses = await apiRepositoryImplementation.
    // getCountryList(request: CountryRequest(
    //     sources: '',
    //     page: 0,
    //     pageSize: 0
    // ));
     expect(country,  '');
  });
}