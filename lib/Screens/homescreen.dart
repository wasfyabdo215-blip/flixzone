import 'package:flutter/material.dart';



class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  final List<Map<String, dynamic>> movies = const [
    {"name": "Spider-Man", "img": "assets/spider.jpg", "rate": 4.8},
    {"name": "Joker", "img": "assets/joker.jpg", "rate": 4.9},
    {"name": "Forrest Gump", "img": "assets/forrestgammp.jpg", "rate": 4.5},
    {"name": "Inception", "img": "assets/inception.jpg", "rate": 4.8},
    {"name": "Avengers", "img": "assets/avengers.jpg", "rate": 4.7},
  ];

  final List<Map<String, dynamic>> series = const [
    {"name": "Dark", "img": "assets/dark.jpg", "rate": 4.7},
    {"name": "Breaking Bad", "img": "assets/breakingbad.jpg", "rate": 5.0},
    {"name": "Game Of Thrones", "img": "assets/game.jpg", "rate": 4.9},
    {"name": "The Walking dead", "img": "assets/Walking.jpg", "rate": 4.9},
    {"name": "Peaky Plinders", "img": "assets/peaky.jpg", "rate": 4.4},
  ];

  final List<Map<String, dynamic>> anime = const [
    {"name": "Hunter x Hunter", "img": "assets/hunterxhunter.jpg", "rate": 4.9},
    {"name": "Attack on Titan", "img": "assets/attack.jpg", "rate": 4.8},
    {"name": "Jujutsu Kaisen", "img": "assets/jujutsukaisen.jpg", "rate": 4.7},
    {"name": "Naruto", "img": "assets/naruto.jpg", "rate": 4.8},
    {"name": "Viland Saga", "img": "assets/vinland.jpg", "rate": 4.8},
  ];

  final List<Map<String, dynamic>> trending = const [
    {"name": "Interstellar", "img": "assets/interstellar.jpg", "rate": 4.9},
    {"name": "Attack on Titan", "img": "assets/attack.jpg", "rate": 4.8},
    {"name": "Se7en", "img": "assets/seven.jpg", "rate": 4.5},
    {"name": "Dune", "img": "assets/dune.jpg", "rate": 4.7},
    {"name": "Breaking Bad", "img": "assets/breakingbad.jpg", "rate": 4.9},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Icon(Icons.play_circle_fill, color: Colors.redAccent, size: 60),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: ' Flix', style: TextStyle(color: Colors.redAccent, fontSize: 40, fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Zone', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              _buildSearchBar(),
              const SizedBox(height: 30),
              _buildMovieSection("Movies", movies),
              const SizedBox(height: 25),
              _buildMovieSection("Series", series),
              const SizedBox(height: 25),
              _buildMovieSection("Anime", anime),
              const SizedBox(height: 25),
              _buildMovieSection("Top Rated", trending),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(15)),
        child: const TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: Colors.redAccent),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }

  Widget _buildMovieSection(String title, List<Map<String, dynamic>> dataList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 15),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 310,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: dataList.length,
            itemBuilder: (context, index) {

              return MovieCard(
                imagePath: dataList[index]['img'],
                name: dataList[index]['name'],
                rate: dataList[index]['rate'],
              );
            },
          ),
        ),
      ],
    );
  }
}


class MovieCard extends StatefulWidget {
  final String imagePath;
  final String name;
  final double rate;

  const MovieCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.rate,
  });

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  widget.imagePath,
                  height: 220,
                  width: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 220,
                    width: 150,
                    color: Colors.grey[900],
                    child: const Icon(Icons.broken_image, color: Colors.redAccent),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            widget.name,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 16),
              const SizedBox(width: 5),
              Text(
                widget.rate.toString(),
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}