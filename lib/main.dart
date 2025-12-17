import 'package:cats_app/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/cats/presentation/bloc/cats_bloc.dart';
import 'features/cats/presentation/pages/cats_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp(catsBloc: di.sl<CatsBloc>()));
}

class MyApp extends StatelessWidget {
  final CatsBloc catsBloc;
  const MyApp({super.key, required this.catsBloc});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat App BLoC Compacto',
      // Usamos BlocProvider.value para inyectar la instancia global
      home: BlocProvider.value(value: catsBloc, child: const CatsPage()),
    );
  }
}
