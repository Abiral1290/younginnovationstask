import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:younginnovationstask/src/domain/model/response/image_list_response.dart';

import 'package:younginnovationstask/src/presentation/bloc/cubit/image_list_cubit.dart';
import 'package:younginnovationstask/src/presentation/bloc/state/image_list_state.dart';
import 'package:younginnovationstask/src/presentation/view/image_list_view.dart';
class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);



  //final scrollController = useScrollController();

  @override
  Widget build(BuildContext context) {

    Widget _buildGridList({List<ImageListResponse>? gridList}){
      return CustomScrollView(
        shrinkWrap: true,
     //    controller: scrollController,
        slivers: [
          SliverGrid(

              delegate: SliverChildBuilderDelegate(
                childCount: gridList!.length,
                      (context, index) =>
                          ImageListView(imageListResponse:
                          gridList![index])), gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3))
        ],
      );
    }

    return  Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ImageListCubit,ImageListState>(
          builder:(_,state){
            switch(state.runtimeType){
              case ImageListStateLoading():
                return const Center(child: CircularProgressIndicator(),);
              case ImageListStateFailed():
                return const Center(child: Text('No Data'),);
              case ImageListStateSuccess():
                return _buildGridList(gridList: state.imageListResponse);
              default:
                return const SizedBox();
            }
          }
      ),
    );
      
     
  }
}
