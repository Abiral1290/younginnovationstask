import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';
import 'package:younginnovationstask/src/data/datasources/remote/image_list_api_services.dart';
import 'package:younginnovationstask/src/data/repositories/api_repository_implementation.dart';
import 'package:younginnovationstask/src/domain/model/response/image_list_response.dart';

class MockImageListApiServices extends Mock implements ImageListApiServices{}


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

    when(mockImageListApiServices.getImageList('', 1))
        .thenAnswer((_) async => HttpResponse(country,response));
     ApiRepositoryImplementation(mockImageListApiServices);

     expect(country,  '');
  });
}