import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:younginnovationstask/src/domain/repository/api_repository.dart';
import 'package:younginnovationstask/src/locator.dart';
import 'package:younginnovationstask/src/presentation/bloc/cubit/image_list_cubit.dart';
import 'package:younginnovationstask/src/presentation/view/home_page.dart';

void main() async{

  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=> ImageListCubit(
            locator<ApiRepository>()
          )..getImageList())
        ], child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
    ));
  }
}


