import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
   int page = 1;




  @override
  Widget build(BuildContext context) {


    scrollController.addListener(()async {
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

    Widget _buildGridList({List<ImageListResponse>? gridList}){
      return ListView(
        children: [
          Padding(
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
                    searchKeywords: "&$str"
                ));
              },
            ),
          ),
          CustomScrollView(
            shrinkWrap: true,
     physics: NeverScrollableScrollPhysics(),
     //    controller: scrollController,
            slivers: [
              SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: gridList!.length,
                          (context, index) =>
                              FittedBox(
                                  fit: BoxFit.fill,
                                  child: Image.network(
                                      gridList[index].userImageURL.toString()))), gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          ))
            ],
          ),
        ],
      );
    }

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
                return  Column(
                  children: [
                    Padding(
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
                    // GridView.builder(
                    //   shrinkWrap: true,
                    //   controller:  scrollController..addListener(() {
                    //     log("my page ${page}");
                    //     if(scrollController.position.atEdge
                    //         && scrollController.position.pixels !=0){
                    //       BlocProvider.of<ImageListCubit>
                    //         (context).getImageList(imageListRequest:
                    //       ImageListRequest(
                    //           page: page++,
                    //           searchKeywords: ''
                    //       ));
                    //       log("my page ${page}");
                    //     }
                    //   }),
                    // gridDelegate:
                    // SliverGridDelegateWithFixedCrossAxisCount(
                    //   crossAxisCount: 2,
                    //   crossAxisSpacing: 18,
                    //   mainAxisSpacing: 18,
                    // ),itemCount: state.imageListResponse.length +1,
                    //     itemBuilder: (context, index){
                    //   if(index < state.imageListResponse.length){
                    //     return FittedBox(
                    //         fit: BoxFit.fill,
                    //         child: Image.network(
                    //             state.imageListResponse
                    //             [index].largeImageURL.toString()));
                    //   }else{
                    //     return const Padding(
                    //       padding:  EdgeInsets.all(8.0),
                    //       child: Center(
                    //         child:  CircularProgressIndicator(),
                    //       ),
                    //     );
                    //   }
                    // }),
                    Expanded(
                      child: Container(
                        child: CustomScrollView(
                          controller: scrollController..addListener(() {
                            log("my page ${page}");
                            if(scrollController.position.atEdge
                            && scrollController.position.pixels !=0){
                              BlocProvider.of<ImageListCubit>
                                (context).getImageList(imageListRequest:
                              ImageListRequest(
                                  page: page++,
                                  searchKeywords: ''
                              ));
                              log("my pages ${page}");
                            }
                          }),
                          shrinkWrap: true,
                          slivers: [
                            SliverGrid(
                                delegate: SliverChildBuilderDelegate(
                                    childCount: state.imageListResponse.length +1,
                                        (context, index){
                                      if(index < state.imageListResponse.length){
                                        return InkWell(
                                          onTap: (){
                                            BlocProvider.of<FavouriteImageListCubit>
                                              (context).insertFavoriteImage
                                              (imageListResponse:
                                            state.imageListResponse[index]);
                                          },
                                          child: FittedBox(
                                              fit: BoxFit.fill,
                                              child: Image.network(
                                                  state.imageListResponse
                                                  [index].largeImageURL.toString())),
                                        );
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
                        ),
                      ),
                    ),
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
