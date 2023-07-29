import 'package:blocc/pages/bottomshet_page.dart';
import 'package:blocc/pages/home_page.dart';
import 'package:blocc/pages/post_add_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'block/list_post_cubit.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>ListPostCubit()),
        ],
        child: Home_page(),
      ),
      //
      routes: {
        Home_page.id:(context)=>Home_page(),
        Post_add_page.id:(context)=>Post_add_page(),
        BottomSheetpage.id:(context)=>BottomSheetpage(),
      },
    );

  }
}