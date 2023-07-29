import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../block/list_post_cubit.dart';
import '../model/post_model.dart';
import '../pages/bottomshet_page.dart';


Widget itemOfPost(BuildContext context,Post post) {
  return Slidable(
    actionPane: const SlidableDrawerActionPane(),
    actionExtentRatio: 0.25,
    child: Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            post.fullname!.toUpperCase(),
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5,),

          // Body
          Text(post.mobile.toString()),
        ],
      ),
    ),
    actions: [
      IconSlideAction(
        caption: 'Update',
        color: Colors.indigo,
        icon: Icons.edit,
        onTap: () {

          Navigator.push(context, MaterialPageRoute(builder: (context) => BottomSheetpage(fullname: post.fullname.toString(),mobile: post.mobile.toString())));
        },
      ),
    ],

    secondaryActions: [
      IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () {
          BlocProvider.of<ListPostCubit>(context).apiPostDelete(post);
        },
      ),
    ],
  );
}