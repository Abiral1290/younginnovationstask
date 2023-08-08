import '../../domain/model/response/image_list_response.dart';
import 'package:flutter/material.dart';
class ImageListView extends StatelessWidget {

  final ImageListResponse imageListResponse;

  const ImageListView({Key? key,required this.imageListResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      width: 80,
      child: Column(
        children: [
          Text(
            imageListResponse.user ?? '',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Butler',
              fontWeight: FontWeight.w900,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          FittedBox(
            fit: BoxFit.fill,
              child: Image.network(imageListResponse.userImageURL.toString())),
          Divider(),
        ],
      ),
    );
  }
}
