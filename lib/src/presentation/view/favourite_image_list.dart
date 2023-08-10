import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:younginnovationstask/src/presentation/bloc/cubit/search_list_cubit.dart';
import 'package:younginnovationstask/src/presentation/bloc/state/favourite_image_list_state.dart';
import 'package:younginnovationstask/src/presentation/view/image_list_view.dart';
import 'package:younginnovationstask/src/utilis/constants/strings.dart';


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
      appBar: AppBar(
        title: const Text(favouriteImageList),
      ),
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
                                 return Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: ImageListView(imageListResponse: state.favouriteImageList[index], onTap: (){
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
                                           Navigator.pop(context);
                                           ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                         });
                                       },
                                     );
                                   }),
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
