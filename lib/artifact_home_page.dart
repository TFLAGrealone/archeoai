import 'package:flutter/material.dart';

class Artifact {
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  Artifact({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

class ArtifactHomePage extends StatefulWidget {
  const ArtifactHomePage({super.key});

  @override
  State<ArtifactHomePage> createState() => _ArtifactHomePageState();
}

class _ArtifactHomePageState extends State<ArtifactHomePage> {
  final List<Artifact> _allArtifacts = [
    Artifact(
      name: 'Rosetta Stone',
      description: 'Ancient Egyptian stone slab inscribed with a decree.',
      imageUrl: 'https://images.unsplash.com/photo-1605333396915-47ed6b68a00e?q=80&w=400',
      price: 1200000,
    ),
    Artifact(
      name: 'Terracotta Soldier',
      description: 'A life-size funerary statue from the First Emperor of China.',
      imageUrl: 'https://images.unsplash.com/photo-1599110364762-2315b62b1451?q=80&w=400',
      price: 50000,
    ),
    Artifact(
      name: 'Tutankhamun Mask',
      description: 'The golden death mask of the boy king Tutankhamun.',
      imageUrl: 'https://images.unsplash.com/photo-1544413647-ad3482703901?q=80&w=400',
      price: 9000000,
    ),
    Artifact(
      name: 'Antikythera Mechanism',
      description: 'Ancient Greek analog computer used to predict astronomical positions.',
      imageUrl: 'https://images.unsplash.com/photo-1524311583145-d5593bd3502a?q=80&w=400',
      price: 750000,
    ),
    Artifact(
      name: 'Venus de Milo',
      description: 'Ancient Greek statue depicting the goddess Aphrodite.',
      imageUrl: 'https://images.unsplash.com/photo-1582555172866-f73bb12a2ab3?q=80&w=400',
      price: 5000000,
    ),
    Artifact(
      name: 'Dead Sea Scrolls',
      description: 'Ancient Jewish religious manuscripts found in the Qumran Caves.',
      imageUrl: 'https://images.unsplash.com/photo-1501535033-a5939c0bc4a4?q=80&w=400',
      price: 2000000,
    ),
  ];

  List<Artifact> _filteredArtifacts = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredArtifacts = _allArtifacts;
  }

  void _filterArtifacts(String query) {
    setState(() {
      _filteredArtifacts = _allArtifacts
          .where((artifact) =>
              artifact.name.toLowerCase().contains(query.toLowerCase()) ||
              artifact.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E6CA), // Parchment/Sand color
      appBar: AppBar(
        title: const Text(
          'ArcheoAI Museum Store',
          style: TextStyle(fontFamily: 'Serif', fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF8D6E63), // Brownish color
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterArtifacts,
              decoration: InputDecoration(
                hintText: 'Search artifacts...',
                prefixIcon: const Icon(Icons.search, color: Color(0xFF5D4037)),
                filled: true,
                fillColor: Colors.white.withOpacity(0.8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: _filteredArtifacts.length,
              itemBuilder: (context, index) {
                final artifact = _filteredArtifacts[index];
                return _buildArtifactCard(artifact);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArtifactCard(Artifact artifact) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                artifact.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported, size: 50),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  artifact.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Serif',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  artifact.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${artifact.price.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5D4037),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_shopping_cart, size: 20),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${artifact.name} added to cart')),
                        );
                      },
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
