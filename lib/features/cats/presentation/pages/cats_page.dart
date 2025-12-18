import 'package:cats_app/features/cats/presentation/bloc/cats_bloc.dart';
import 'package:cats_app/features/cats/presentation/widgets/breed_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Scaffold(
      body: BlocBuilder<CatsBloc, CatsState>(
        builder: (context, state) {
          if (state is CatsInitial) {
            return const Center(child: Text('App initialized'));
          }
          if (state is CatsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CatsLoaded) {
            return ListView.builder(
              itemCount: state.cats.length,
              itemBuilder: (context, index) {
                /* final cat = state.cats[index]; */
                return BreedCard(
                  breedName: state.cats[index].name,
                  imageUrl: state.cats[index].imageUrl,
                  origin: state.cats[index].origin.length > 10
                      ? state.cats[index].origin.substring(0, 10) + "..."
                      : state.cats[index].origin,
                  intelligence: state.cats[index].intelligence,
                );
              },
            );
          }

          if (state is CatsError) {
            return Center(child: Text(state.message));
          }

          return Container();
        },
      ),
    );
  }
}
