import 'package:flutter/material.dart';

class BreedCard extends StatelessWidget {
  final String breedName;
  final String imageUrl;
  final String origin;
  final String intelligence;

  const BreedCard({
    Key? key,
    required this.breedName,
    required this.imageUrl,
    required this.origin,
    required this.intelligence,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.all(8.0),
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(4.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(breedName, style: const TextStyle(fontSize: 20)),
                  Text(
                    "Ver mas",
                    style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              const Divider(),
              SizedBox(height: 8.0),
              Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 8.0),
              const Divider(),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("origin: $origin", style: const TextStyle(fontSize: 20)),
                  Text(
                    "intelligence: $intelligence",
                    style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
