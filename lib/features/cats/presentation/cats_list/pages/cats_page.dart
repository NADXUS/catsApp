import 'package:cats_app/features/cats/presentation/cats_list/bloc/cats_bloc.dart';
import 'package:cats_app/features/cats/presentation/cats_list/widgets/breed_card.dart';
import 'package:cats_app/features/cats/presentation/cats_list/widgets/search_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatsPage extends StatelessWidget {
  const CatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CatBreeds',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<CatsBloc, CatsState>(
          builder: (context, state) {
            return switch (state) {
              CatsInitial() => const Center(child: Text('App initialized')),
              CatsLoading() => const Center(child: CircularProgressIndicator()),
              CatsError(message: var msg) => Center(child: Text(msg)),
              CatsLoaded(cats: var catsList) => Column(
                children: [
                  SearchFilter(
                    onchange: (value) =>
                        context.read<CatsBloc>().add(FilterCats(value)),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: catsList.length,
                      itemBuilder: (context, index) {
                        final cat = catsList[index];
                        return BreedCard(cat: cat);
                      },
                    ),
                  ),
                ],
              ),
            };
          },
        ),
      ),
    );
  }
}
