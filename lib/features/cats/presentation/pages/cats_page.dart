import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cats_bloc.dart';

class CatsPage extends StatefulWidget {
  const CatsPage({super.key});

  @override
  State<CatsPage> createState() => _CatsPageState();
}

class _CatsPageState extends State<CatsPage> {
  @override
  void initState() {
    super.initState();
    context.read<CatsBloc>().add(FetchCats());
  }

  @override
  Widget build(BuildContext context) {
    return const CatsView();
  }
}

class CatsView extends StatelessWidget {
  const CatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cat Breeds BLoC')),
      body: BlocBuilder<CatsBloc, CatsState>(
        builder: (context, state) {
          return switch (state) {
            CatsInitial() => const Center(child: Text('Iniciando...')),
            CatsLoading() => const Center(child: CircularProgressIndicator()),
            CatsLoaded(cats: var catsList) => ListView.builder(
              itemCount: catsList.length,
              itemBuilder: (context, index) {
                final cat = catsList[index];
                return Text(cat.name, style: const TextStyle(fontSize: 18));
              },
            ),
            CatsError(message: var errorMsg) => Center(
              child: Text(errorMsg, style: const TextStyle(color: Colors.red)),
            ),
          };
        },
      ),
    );
  }
}
