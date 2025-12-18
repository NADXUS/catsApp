import 'package:cats_app/features/cats/presentation/bloc/cats_bloc.dart';
import 'package:cats_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'features/cats/presentation/pages/cats_page.dart';

void main() async {
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetIt.instance<CatsBloc>()),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: CatsPage()),
    );
  }
}
