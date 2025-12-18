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
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(
                        color: Color.fromARGB(255, 0, 0, 255),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        10.0,
                        4.0,
                        10.0,
                        4.0,
                      ), // Ajusta el padding horizontal(8.0),
                      child: Text(
                        "Ver mas",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              const Divider(),
              SizedBox(height: 8.0),
              Image.network(
                imageUrl,
                height: 260,
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
