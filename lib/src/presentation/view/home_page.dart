import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer_effect/shimmer_effect.dart';
import 'package:younginnovationstask/src/domain/model/request/image_list_request.dart';
import 'package:younginnovationstask/src/domain/model/response/image_list_response.dart';

import 'package:younginnovationstask/src/presentation/bloc/cubit/image_list_cubit.dart';
import 'package:younginnovationstask/src/presentation/bloc/cubit/search_list_cubit.dart';
import 'package:younginnovationstask/src/presentation/bloc/state/favourite_image_list_state.dart';
import 'package:younginnovationstask/src/presentation/bloc/state/image_list_state.dart';
import 'package:younginnovationstask/src/presentation/view/favourite_image_list.dart';
import 'package:younginnovationstask/src/presentation/view/image_list_view.dart';
class Homepage extends StatelessWidget {
   Homepage({Key? key}) : super(key: key);



 final scrollController = ScrollController();





  @override
  Widget build(BuildContext context) {


    scrollController.addListener(()async {
      int page = 2;
      double showoffset = 40.0;
      log("my page ${page}");
      if(scrollController.position.atEdge
          && scrollController.position.pixels !=0){
       await BlocProvider.of<ImageListCubit>
          (context).getImageList(imageListRequest:
        ImageListRequest(
            page: page++,
            searchKeywords: ''
        ));
        log("my pages ${page}");
      }

    });


    return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder:
            (context)=>const FavouriteImageList()));
      }),
      appBar: AppBar(),
      body: BlocBuilder<ImageListCubit,ImageListState>(
          builder:(_,state){
            switch(state.runtimeType){
              case ImageListStateLoading:
                return const Center(child: CircularProgressIndicator(),);
              case ImageListStateFailed:
                return const Center(child: Text('No Data'),);
              case ImageListStateSuccess:
                return  CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child:       Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,), //<-- SEE HERE
                            ),
                          ),
                          onChanged: (str){
                            BlocProvider.of<ImageListCubit>
                              (context).getImageList(imageListRequest:
                            ImageListRequest(
                                searchKeywords: str
                            ));
                          },
                        ),
                      ),
                    ),
                    SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                            childCount: state.imageListResponse.length +1,
                            (context,index) {
                                  if(index < state.imageListResponse.length){
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ImageListView(
                                          imageListResponse: state.imageListResponse[index], onTap: (){
                                        BlocProvider.of<FavouriteImageListCubit>
                                          (context).insertFavoriteImage
                                          (imageListResponse:
                                        state.imageListResponse[index]);

                                        final snackBar = SnackBar(
                                          content: const Text('Favourite image saved'),
                                          action: SnackBarAction(
                                            label: 'Undo',
                                            onPressed: () {
                                              // Some code to undo the change.
                                            },
                                          ),
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                      }),
                                    );
                                  }else{
                                    return   Padding(
                                      padding:  EdgeInsets.all(8.0),
                                      child: Center(
                                        child:  Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: ListView.builder(
                                            itemCount: 2,
                                            itemBuilder: (context, index) {
                                              return Card(
                                                elevation: 1.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(16),
                                                ),
                                                child: const SizedBox(height: 80),
                                              );
                                            },
                                          ),
                                        )
                                      )
                                    );
                                  }
                                }
                        ), gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                    )
                    )
                  ],
                );
              default:
                return const SizedBox();
            }
          }
      ),
    );
  }
}
