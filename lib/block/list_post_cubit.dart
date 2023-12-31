import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/post_model.dart';
import '../services/http_service.dart';
import 'list_post_state.dart';

class ListPostCubit extends Cubit<ListPostState>{
  bool isLoading =false;

  ListPostCubit():super (ListPostInit());


  void apiPostList()async{
    emit(ListPostLoading());
    var response= await Network.GET(Network.API_LIST,Network.paramsEmpty());

    if(response!=null){
      emit(ListPostLoaded(posts: Network.parsePostList(response)));
    }else{
      emit(ListPostError(error: "Coundn't fetch posts"));
    }
    isLoading=false;
  }




  void apiPostDelete(Post post)async{
    emit(ListPostLoading());
    final response=await Network.DEL(Network.API_DELETE+post.id.toString(), Network.paramsEmpty());
    print(response);
    if(response !=null){
      apiPostList();
    }else{
      emit(ListPostError(error: "Coundn't delete post"));
    }

  }
}