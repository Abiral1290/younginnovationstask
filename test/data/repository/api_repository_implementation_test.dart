// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:mockito/annotations.dart';
// import 'package:technofexdemoapp/src/data/repositories/api_repository_implementation.dart';
// import 'package:technofexdemoapp/src/data/repositories/base/base_api_repository.dart';
// import 'package:technofexdemoapp/src/domain/model/request/country_request.dart';
// import 'package:technofexdemoapp/src/domain/model/responses/country_response.dart';
// import 'package:technofexdemoapp/src/domain/repositories/api_repository.dart';
// import 'package:technofexdemoapp/src/utilis/constants/nums.dart';
//
// class MockBaseApiRepository extends Mock implements BaseApiRepository{}
//
//
// @GenerateMocks(<Type>[MockBaseApiRepository])
// // void main() {
// //   MockBaseApiRepository? mockBaseApiRepository;
// //
// //     final List<Country> country = (
// //       <Country>[
// //         Country(
// //             country: 'abraham', iso2: 'jhu', iso3: 'jghf'
// //         )
// //       ]
// //   );
// //
// //
// //
// //   setUp(() => mockBaseApiRepository = MockBaseApiRepository());
// //
// //
// //   test('request fetch list', ()async{
// //     when(mockBaseApiRepository!.getStateOf<Country>(request: ()=> CountryRequest(
// //       sources: 'countriesnow.space',
// //       page: 1,
// //       pageSize: defaultPageSize,
// //     ))).thenThrow(DioError(requestOptions: RequestOptions(path: '')));
// //
// //     // final BaseApiRepository baseApiRepository
// //     // = mockBaseApiRepository!;
// //     //
// //     // final Country response = await baseApiRepository.getStateOf(request: ()=> '');
// //     expect(country, response.country);
// //   });
// // }