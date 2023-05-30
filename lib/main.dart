import 'package:creole/bloc/user_bloc.dart';
import 'package:creole/models/User.dart';
import 'package:creole/repo/user_repository.dart';
import 'package:creole/views/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {

  runApp( MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AvatarBloc(AvatarRepository()),
      ),
    ], child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creole Studios',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) => AvatarBloc(AvatarRepository()),
        child: UserPage(),
      ),
    );
  }
}
