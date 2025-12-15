import 'package:flutter/material.dart';

class Buoi5Screen extends StatelessWidget {
  const Buoi5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final savedPlaces = [
      {
        'name': 'Torii Gate',
        'image':
            'https://images.unsplash.com/photo-1505843513577-22bb7d21e455?auto=format&fit=crop&w=300&h=300&q=80',
      },
      {
        'name': 'Cathedral',
        'image':
            'https://images.unsplash.com/photo-1505843513577-22bb7d21e455?auto=format&fit=crop&w=300&h=300&q=80',
      },
      {
        'name': 'Castle',
        'image':
            'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?auto=format&fit=crop&w=300&h=300&q=80',
      },
      {
        'name': 'Colosseum',
        'image':
            'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?auto=format&fit=crop&w=300&h=300&q=80',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "WELCOME UI",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue.shade900,
        elevation: 0,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topIcons(),
              const SizedBox(height: 16),
              _welcomeText(),
              const SizedBox(height: 24),
              _searchBar(),
              const SizedBox(height: 32),
              const Text(
                'Saved Places',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              _savedPlacesGrid(savedPlaces),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {},
        ),
        IconButton(icon: const Icon(Icons.star), onPressed: () {}),
      ],
    );
  }

  Widget _welcomeText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome,',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
        ),
        Text(
          'Manh Phuoc',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _searchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue.shade400, width: 2),
        ),
      ),
    );
  }

  Widget _savedPlacesGrid(List<Map<String, String>> places) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: places.length,
      itemBuilder: (context, index) {
        final place = places[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Image.network(
                place['image']!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.image_not_supported),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                  ),
                ),
                child: Text(
                  place['name']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
