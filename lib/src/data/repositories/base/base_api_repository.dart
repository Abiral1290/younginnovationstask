

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';

import '../../../utilis/resources/data_state.dart';

abstract class BaseApiRepository{

  @protected
  Future<DataState<T>> getstate<T>({
   required Future<HttpResponse<T>?>? Function() request
})  async {

    try{
      final httpresponse = await request();
      if(httpresponse!.response.statusCode == HttpStatus.ok){
        return DataSuccess(httpresponse.data);
  }else{
        throw DioException(requestOptions: httpresponse.
        response.requestOptions);
  }
    }on DioException catch(error){
      return DataFailed(error);
  }
}

}