import '../../domain/model/response/image_list_response.dart';
import 'package:flutter/material.dart';
class ImageListView extends StatelessWidget {

  final ImageListResponse imageListResponse;
  final VoidCallback onTap;

  const ImageListView({Key? key,required this.imageListResponse,
    required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
        decoration:   BoxDecoration(
          border: Border.all(
              color:   Color(0xFF000000),
              width: 2.0,
              style: BorderStyle.solid), //Border.all
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Expanded(
          child: Column(
            children: [
              InkWell(
                onTap: onTap,
                child: Image.network(
                    imageListResponse.largeImageURL.toString()),
              ),
              Text(imageListResponse.user!,style: Theme.of(context).textTheme.titleLarge,)
            ],
          ),
        ),
      );

  }
}
