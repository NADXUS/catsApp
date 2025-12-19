import 'package:cats_app/features/cats/domain/entities/cat_entity.dart';
import 'package:cats_app/features/cats/presentation/cat_detail/pages/cat_detail_page.dart';
import 'package:flutter/material.dart';

class BreedCard extends StatelessWidget {
  final CatEntity cat;

  const BreedCard({Key? key, required this.cat}) : super(key: key);

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
                  Text(cat.name, style: const TextStyle(fontSize: 20)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CatDetailPage(cat: cat),
                        ),
                      );
                    },
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
                      padding: const EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
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
                cat.imageUrl,
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
                  Text(
                    "origin: ${cat.origin.length > 10 ? "${cat.origin.substring(0, 10)}..." : cat.origin}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    "intelligence: ${cat.intelligence}",
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
