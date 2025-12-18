import 'package:cats_app/features/cats/domain/entities/cat_entity.dart';
import 'package:flutter/material.dart';

class CatDetailPage extends StatefulWidget {
  final CatEntity? cat;
  const CatDetailPage({super.key, this.cat});
  @override
  _CatDetailPageState createState() => _CatDetailPageState();
}

class _CatDetailPageState extends State<CatDetailPage> {
  Map<String, CatEntity> cats = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cat == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Cat Detail')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text(widget.cat?.name ?? 'Cat Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if ((widget.cat?.imageUrl ?? '').isNotEmpty)
              Image.network(
                widget.cat!.imageUrl,
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.cover,
              )
            else
              const Icon(Icons.pets, size: 120),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cat?.description ?? 'Unknown',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Divider(color: Colors.grey[400]),
                    const SizedBox(height: 10),
                    Text(
                      'Origin: ${widget.cat?.origin ?? 'Unknown'}',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    Divider(color: Colors.grey[400]),
                    const SizedBox(height: 10),
                    Text(
                      'Intelligence: ${widget.cat?.intelligence ?? 'Unknown'}',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    Divider(color: Colors.grey[400]),
                    const SizedBox(height: 10),
                    Text(
                      'Temperament: ${widget.cat?.temperament ?? 'Unknown'}',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    Divider(color: Colors.grey[400]),
                    const SizedBox(height: 10),
                    Text(
                      'Life Span: ${widget.cat?.lifeSpan ?? 'Unknown'} years',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    Divider(color: Colors.grey[400]),
                    const SizedBox(height: 10),
                    Text(
                      'Adaptability: ${widget.cat?.adaptability ?? 'Unknown'}',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    Divider(color: Colors.grey[400]),
                    const SizedBox(height: 10),
                    Text(
                      'Affection Level: ${widget.cat?.affectionLevel ?? 'Unknown'}',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
