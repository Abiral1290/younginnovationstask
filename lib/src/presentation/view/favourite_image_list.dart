import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:younginnovationstask/src/presentation/bloc/cubit/search_list_cubit.dart';
import 'package:younginnovationstask/src/presentation/bloc/state/favourite_image_list_state.dart';
import 'package:younginnovationstask/src/presentation/view/image_list_view.dart';


class FavouriteImageList extends StatelessWidget {
  const FavouriteImageList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavouriteImageListCubit,FavouriteImageListState>(
          builder:(_,state){
            switch(state.runtimeType){
              case FavouriteImageListStateLoading:
                return const Center(child: CircularProgressIndicator(),);
              case FavouriteImageListStateFailed:
                return const Center(child: Text('No Data'),);
              case FavouriteImageListStateSuccess:
                return   CustomScrollView(

                  shrinkWrap: true,
                  slivers: [
                    SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                            childCount: state.favouriteImageList.length +1,
                                (context, index){
                              if(index < state.favouriteImageList.length){
                                return FittedBox(
                                    fit: BoxFit.fill,
                                    child: Image.network(
                                        state.favouriteImageList
                                        [index].largeImageURL.toString()));
                              }else{
                                return const Padding(
                                  padding:  EdgeInsets.all(8.0),
                                  child: Center(
                                    child:  CircularProgressIndicator(),
                                  ),
                                );
                              }
                            }
                        ), gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                    ))
                  ],
                );
           //       ImageListView(imageListResponse: state.favouriteImageList)
              default:
                return const SizedBox();
            }
          }
      ),
    );
  }
}
