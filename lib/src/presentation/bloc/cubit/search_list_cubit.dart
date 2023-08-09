
import 'package:younginnovationstask/src/domain/model/request/image_list_request.dart';
import 'package:younginnovationstask/src/domain/model/response/image_list_response.dart';
import 'package:younginnovationstask/src/domain/repository/database_repository.dart';
import 'package:younginnovationstask/src/presentation/bloc/base/base_cubit.dart';
import 'package:younginnovationstask/src/presentation/bloc/state/favourite_image_list_state.dart';


class FavouriteImageListCubit extends BaseCubit<FavouriteImageListState,List<ImageListResponse>>{

  final DatabaseRepository _databaseRepository;

  FavouriteImageListCubit(this._databaseRepository):
        super(const FavouriteImageListStateLoading(),const[]);


  Future<void> getAllFavoriteImage()async{
    emit(await _getFavouriteImageList());
  }

  Future<void> insertFavoriteImage({required ImageListResponse imageListResponse})async{
    await _databaseRepository.insertImage(imageListResponse);
    emit(await _getFavouriteImageList());
  }

  Future<void> removeFavoriteImage(ImageListResponse imageListResponse)async{
    await _databaseRepository.removeImage(imageListResponse);
    emit(await _getFavouriteImageList());
  }

  Future<FavouriteImageListState> _getFavouriteImageList()async{
    final favouriteImageList = await _databaseRepository.getImageList();
    return FavouriteImageListStateSuccess(favouriteImageList: favouriteImageList);
  }

}