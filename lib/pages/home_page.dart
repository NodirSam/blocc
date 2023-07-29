import 'package:blocc/pages/post_add_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../block/list_post_cubit.dart';
import '../block/list_post_state.dart';
import '../model/post_model.dart';
import '../views/view_of_home.dart';

class Home_page extends StatefulWidget {
  //const Home_page({required Key key}) : super(key: key);
  static const String id="home_page";

  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  List<Post> items = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListPostCubit>(context).apiPostList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    BlocProvider.of<ListPostCubit>(context).apiPostList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc'),
        centerTitle: true,
      ),
      body: BlocBuilder<ListPostCubit,ListPostState>(
        builder: (BuildContext context, ListPostState state){
          if(state is ListPostError){
            return viewOfHome(items, true);
          }
          if(state is ListPostLoaded){
            items=state.posts!;
            return viewOfHome(items, false);
          }
          return viewOfHome(items, true);
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, Post_add_page.id);
        },
        child: const Icon(Icons.add),
      ),
    );
  }


}