import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:younginnovationstask/src/presentation/bloc/cubit/search_list_cubit.dart';
import 'package:younginnovationstask/src/presentation/bloc/state/favourite_image_list_state.dart';
import 'package:younginnovationstask/src/presentation/view/image_list_view.dart';


class FavouriteImageList extends StatelessWidget {
  const FavouriteImageList({super.key});

  @override
  Widget build(BuildContext context) {


    Widget button({required VoidCallback onTap,required String text}) => TextButton(
      onPressed:  onTap,
      child:  Text(text),
    );

    // set up the AlertDialog
    AlertDialog alert({required VoidCallback onTapYes,required VoidCallback onTapNo} ) => AlertDialog(
      title: const Text("Delete Image"),
      content: const Text("Would you like to image?"),
      actions: [
        button(onTap: onTapNo, text: "No"),
        button(onTap: onTapYes, text: "Yes")
      ],
    );




    return Scaffold(
      appBar: AppBar(),
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
                            childCount: state.favouriteImageList.length,
                                (context, index){
                                 return Container(
                                   height: 300,
                                   width: 500,
                                   child: Column(
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return alert(onTapNo: (){
                                                Navigator.pop(context);
                                              }, onTapYes: () {
                                                BlocProvider.of<FavouriteImageListCubit>(context).
                                                removeFavoriteImage(state.favouriteImageList[index]);
                                                const snackBar = SnackBar(
                                                  content:  Text('Image removed'),
                                                );
                                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                Navigator.pop(context);
                                              });
                                            },
                                          );
                                        },
                                        child: FittedBox(
                                            fit: BoxFit.fill,
                                            child: Image.network(
                                                 state.favouriteImageList
                                                [index].largeImageURL.toString())),
                                      ),
                                      Text(state.favouriteImageList[index].user!)
                                      // CircleAvatar(
                                      //    backgroundColor: Colors.white,
                                      //   child: IconButton(onPressed: (){
                                      //     // show the dialog
                                      //     // showDialog(
                                      //     //   context: context,
                                      //     //   builder: (BuildContext context) {
                                      //     //     return alert(onTapNo: (){
                                      //     //
                                      //     //     }, onTapYes: () {
                                      //     //       BlocProvider.of<FavouriteImageListCubit>(context).
                                      //     //       removeFavoriteImage(state.favouriteImageList[index]);
                                      //     //       const snackBar = SnackBar(
                                      //     //         content:  Text('Image removed'),
                                      //     //       );
                                      //     //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                      //     //
                                      //     //     });
                                      //     //   },
                                      //     // );
                                      //   }, icon: const Icon(Icons.delete)),
                                      // )
                                    ],
                                ),
                                 );
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
